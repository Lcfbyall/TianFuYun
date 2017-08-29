//
//  PushManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "PushManager.h"
#import "GeTuiSdk.h"

// push config
#ifndef __OPTIMIZE__

//Debug
#define kGtAppId      @"izeW72zPen6dGC9TwejdQA"
#define kGtAppKey     @"Z1UZ3ggEv88hPZ7KB8SIF6"
#define kGtAppSecret  @"Kbwv3SSx7c6N0IDtTE0KA"

#else

//Release
#define kGtAppId      @"m3srbgfBwa9b6mEBk5JBt7"
#define kGtAppKey     @"QFThVGQbfu9b1lHvBaqfp5"
#define kGtAppSecret  @"uPmN0KS6e06TLgiN5PbJ89"

#endif


typedef NS_ENUM(NSInteger, TJSPushType) {
    
    TJSPushTypeSystemMessage = 1,      // 系统消息
    TJSPushTypeProductMessage = 2,     // 产品消息
    TJSPushTypeUpdate = 3,             // 系统升级
};



@interface PushManager ()<GeTuiSdkDelegate>

@end

@implementation PushManager


+ (instancetype)sharedManager {
    
    static PushManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}



#pragma mark - Public

// 初始化个推sdk
+ (void)startGeTuiSDK{

    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:[PushManager sharedManager]];
    [PushManager registerUserNotification];
}

// 重置红点个数
+ (void)resetBadge{

    [GeTuiSdk resetBadge];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

// 设置红点个数
+ (void)setBadge:(NSInteger)badge{

    [GeTuiSdk setBadge:badge];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];

}


#pragma mark - Private

+ (void)registerUserNotification {
    
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

+ (void)registerDeviceToken:(NSString *)token {
    
    [GeTuiSdk registerDeviceToken:token];
}


#pragma mark - <UIApplicationDelegate>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}


// This callback will be made upon calling -[UIApplication registerUserNotificationSettings:]. The settings the user has granted to the application will be passed in as the second argument.
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{

    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0){

    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"deviceToken = %@", token);
    
    [PushManager registerDeviceToken:token];
}

/*
 This method will be invoked even if the application was launched or resumed because of the remote notification. The respective delegate methods will be invoked first. Note that this behavior is in contrast to application:didReceiveRemoteNotification:, which is not called in those cases, and which will not be invoked if this method is implemented. !*/

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0){
    
    NSInteger badge = [userInfo[@"aps"][@"badge"] integerValue];
    
    [PushManager setBadge:badge];
    
    NSString *payLoad = userInfo[@"aps"][@"category"];
    
    if (payLoad) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[payLoad dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        [[PushManager sharedManager] handleRemoteNotification:dict isAPNs:YES];
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
    
}


/*****************************/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_DEPRECATED_IOS(3_0, 10_0){
    
    
}

//Called when your app has been activated by the user selecting an action from a local notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler NS_DEPRECATED_IOS(9_0, 10_0) __TVOS_PROHIBITED{


}

// Called when your app has been activated by the user selecting an action from a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler NS_DEPRECATED_IOS(8_0, 10_0) __TVOS_PROHIBITED{



}



#pragma mark - <GeTuiSdkDelegate>

/**
 *  SDK登入成功返回clientId
 *
 *  @param clientId 标识用户的clientId
 *  说明:启动GeTuiSdk后，SDK会自动向个推服务器注册SDK，当成功注册时，SDK通知应用注册成功。
 *  注意: 注册成功仅表示推送通道建立，如果appid/appkey/appSecret等验证不通过，依然无法接收到推送消息，请确保验证信息正确。
 */
- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId{
    
    if (clientId) {
        NSLog(@"GeTui Cid = %@", clientId);
        
        // TODO: cid保存本地
        //[GVUserDefaults standardUserDefaults].clientId = clientId;
    }
}

/**
 *  SDK通知收到个推推送的透传消息
 *
 *  @param payloadData 推送消息内容
 *  @param taskId      推送消息的任务id
 *  @param msgId       推送消息的messageid
 *  @param offLine     是否是离线消息，YES.是离线消息
 *  @param appId       应用的appId
 */
- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId{

    NSError *error;
    NSDictionary *paramDic = [NSJSONSerialization JSONObjectWithData:payloadData options:NSJSONReadingMutableLeaves error:&error];
    
    [[PushManager sharedManager] handleRemoteNotification:paramDic isAPNs:NO];

}

/**
 *  SDK通知发送上行消息结果，收到sendMessage消息回调
 *
 *  @param messageId “sendMessage:error:”返回的id
 *  @param result    成功返回1, 失败返回0
 *  说明: 当调用sendMessage:error:接口时，消息推送到个推服务器，服务器通过该接口通知sdk到达结果，result为 1 说明消息发送成功
 *  注意: 需第三方服务器接入个推,SendMessage 到达第三方服务器后返回 1
 */
- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result{




}

/**
 *  SDK遇到错误消息返回error
 *
 *  @param error SDK内部发生错误，通知第三方，返回错误
 */
- (void)GeTuiSdkDidOccurError:(NSError *)error{



}

/**
 *  SDK运行状态通知
 *
 *  @param aStatus 返回SDK运行状态
 */
- (void)GeTuiSDkDidNotifySdkState:(SdkStatus)aStatus{



}

/**
 *  SDK设置关闭推送模式回调
 *
 *  @param isModeOff 关闭模式，YES.服务器关闭推送功能 NO.服务器开启推送功能
 *  @param error     错误回调，返回设置时的错误信息
 */
- (void)GeTuiSdkDidSetPushMode:(BOOL)isModeOff error:(NSError *)error{



}

/**
 *  SDK绑定、解绑回调
 *
 *  @param action       回调动作类型 kGtResponseBindType 或 kGtResponseUnBindType
 *  @param isSuccess    成功返回 YES, 失败返回 NO
 *  @param aSn          返回请求的序列码
 *  @param aError       成功返回nil, 错误返回相应error信息
 */
- (void)GeTuiSdkDidAliasAction:(NSString *)action result:(BOOL)isSuccess sequenceNum:(NSString *)aSn error:(NSError *)aError{



}


#pragma mark - 具体业务处理

- (void)handleRemoteNotification:(NSDictionary *)dict isAPNs:(BOOL)isAPNs{




}



@end
