//
//  PushManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "PushManager.h"
#import "GeTuiSdk.h"
#import <UserNotifications/UserNotifications.h>

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



@interface PushManager ()<GeTuiSdkDelegate,UNUserNotificationCenterDelegate>

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

+ (BOOL)isRegisteredForRemoteNotifications{

    if (IOS8_OR_LATER) {

        return [[UIApplication sharedApplication] currentUserNotificationSettings].types;
    }else{
        
       return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
    }
}

// 初始化个推sdk
- (void)startGeTuiSDK{

    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:[PushManager sharedManager]];
    [[PushManager sharedManager] registerUserNotification];
}

// 重置红点个数
- (void)resetBadge{

    [GeTuiSdk resetBadge];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

// 设置红点个数
- (void)setBadge:(NSInteger)badge{

    [GeTuiSdk setBadge:badge];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];

}


#pragma mark - Private

- (void)registerUserNotification {
    
    if(IOS10_OR_LATER){
    
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        
        //UNNotificationAction *action =
        
        //UNNotificationCategory *category =
        
        //NSSet *categories = [NSSet setWithObject:category];
        
        //[center setNotificationCategories:categories];
        
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            
            if(granted){
                
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
            
            if(error){
            
                //如果拒绝，下次请求不会再弹窗，根据业务提醒用户去系统的设置中为你的应用打开通知
            
            
            }
            
        }];
        
    
        return;
    }
    
    if (IOS8_OR_LATER)
    {
        UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        
        UIMutableUserNotificationAction *acceptAction = [[UIMutableUserNotificationAction alloc] init];
        [acceptAction setTitle:@"Accept"];
        [acceptAction setIdentifier:@"ACCEPT_ACTION"];
        //destructive
        [acceptAction setDestructive:NO];
        [acceptAction setAuthenticationRequired:NO];
        //前台或后台
        [acceptAction setActivationMode:UIUserNotificationActivationModeBackground];
        //默认和输入两种 iOS9
        [acceptAction setBehavior:UIUserNotificationActionBehaviorDefault];
        //iOS9  // Parameters that can be used by some types of actions.
        [acceptAction setParameters:@{}];
        
        UIMutableUserNotificationAction *denyAction = [[UIMutableUserNotificationAction alloc] init];
        [denyAction setTitle:@"Deny"];
        [denyAction setIdentifier:@"DENY_ACTION"];
        [denyAction setDestructive:YES];
        [denyAction setAuthenticationRequired:NO];
        [denyAction setActivationMode:UIUserNotificationActivationModeBackground];
        [acceptAction setBehavior:UIUserNotificationActionBehaviorDefault];
        [acceptAction setParameters:@{}];
        
        UIMutableUserNotificationCategory *actionCategory = [[UIMutableUserNotificationCategory alloc] init];
        [actionCategory setIdentifier:@"ACTIONABLE"];
        [actionCategory setActions:@[acceptAction, denyAction]
                        forContext:UIUserNotificationActionContextDefault];
        NSSet *categories = [NSSet setWithObject:actionCategory];
        
        
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    }
    else
    {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
                
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
        #pragma clang diagnostic pop
    }
}

- (void)registerDeviceToken:(NSString *)token {
    
    [GeTuiSdk registerDeviceToken:token];
}



#pragma mark - <TJSAppService>

TJS_EXPORT_SERVICE(@"PushService")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[[PushManager sharedManager] startGeTuiSDK];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0){
    
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [[PushManager sharedManager] registerDeviceToken:token];
}

//application: didReceiveRemoteNotification:fetchCompletionHandler:实现了的话，这个方法不会调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_DEPRECATED_IOS(3_0, 10_0){
    
    
}


#pragma mark - iOS7

/*
 This method will be invoked even if the application was launched or resumed because of the remote notification. The respective delegate methods will be invoked first. Note that this behavior is in contrast to application:didReceiveRemoteNotification:, which is not called in those cases, and which will not be invoked if this method is implemented. !*/

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0){
    
    //非活跃状态，手机锁屏、双击home键都会进入这个状态
    if(application.applicationState == UIApplicationStateInactive){
        
        
    }else if (application.applicationState == UIApplicationStateBackground){
        
        //应用程序在后台运行，例如点击home键进入后台
        
    }else if (application.applicationState == UIApplicationStateActive){
        
        //活跃状态，应用在前台运行
        
    }
    
    
    NSInteger badge = [userInfo[@"aps"][@"badge"] integerValue];
    
    [[PushManager sharedManager] setBadge:badge];
    
    NSString *payLoad = userInfo[@"aps"][@"category"];
    
    if (payLoad) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[payLoad dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        [[PushManager sharedManager] handleRemoteNotification:dict isAPNs:YES];
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
    
}


#pragma mark - iOS8

// This callback will be made upon calling -[UIApplication registerUserNotificationSettings:]. The settings the user has granted to the application will be passed in as the second argument.
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{

    //NS_AVAILABLE_IOS(8_0)
    [application registerForRemoteNotifications];
}

// Called when your app has been activated by the user selecting an action from a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.
- (void)application:(UIApplication *)application
    handleActionWithIdentifier:(nullable NSString *)identifier
         forRemoteNotification:(NSDictionary *)userInfo
  completionHandler:(void(^_Nonnull __strong)(void))completionHandler NS_DEPRECATED_IOS(8_0, 10_0) __TVOS_PROHIBITED{
    
    if ([identifier isEqualToString:@"ACCEPT_ACTION"]) {
        // Sending a request to the server here
        
        
    }
    else if ([identifier isEqualToString:@"DENY_ACTION"]) {
        // Sending a request to the server here
        
        
    }
    
    
    
    //发起请求后，回调中执行
    if (completionHandler) {
        completionHandler();
    }
    
}


#pragma mark - iOS9

// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.

- (void)application:(UIApplication *)application
    handleActionWithIdentifier:(nullable NSString *)identifier
         forRemoteNotification:(NSDictionary *)userInfo
              withResponseInfo:(NSDictionary *)responseInfo
  completionHandler:(void(^_Nonnull __strong)(void))completionHandler NS_DEPRECATED_IOS(9_0, 10_0) __TVOS_PROHIBITED{


}


#pragma mark - iOS10
///
// The method will be called on the delegate only if the application is in the foreground. If the method is not implemented or the handler is not called in a timely manner then the notification will not be presented. The application can choose to have the notification presented as a sound, badge, alert and/or in the notification list. This decision should be based on whether the information in the notification is otherwise visible to the user.
//如何在前台展示通知

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler __IOS_AVAILABLE(10.0) __TVOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0){
    
    //在前台收到通知

    //功能：可设置是否在应用内弹出通知
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
    


}

// The method will be called on the delegate when the user responded to the notification by opening the application, dismissing the notification or choosing a UNNotificationAction. The delegate must be set before the application returns from applicationDidFinishLaunching:.
//这个代理方法会在用户与你推送的通知进行交互时被调用，包括用户通过通知打开了你的应用，或者点击或者触发了某个 action (我们之后会提到 actionable 的通知)。因为涉及到打开应用的行为，所以实现了这个方法的 delegate 必须在 applicationDidFinishLaunching: 返回前就完成设置，这也是我们之前推荐将 NotificationHandler 尽早进行赋值的理由。
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler __IOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0) __TVOS_PROHIBITED{

    //点击推送消息后回调 点击通知栏
    

    completionHandler();
}




#pragma mark -  LocalNotification

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification NS_DEPRECATED_IOS(4_0, 10_0) __TVOS_PROHIBITED{


}

// Called when your app has been activated by the user selecting an action from a local notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^_Nonnull __strong)(void))completionHandler NS_DEPRECATED_IOS(8_0, 10_0) __TVOS_PROHIBITED{
    
    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^_Nonnull __strong)(void))completionHandler NS_DEPRECATED_IOS(9_0, 10_0) __TVOS_PROHIBITED{
    
    
    
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
