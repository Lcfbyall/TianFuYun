//
//  SocailManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SocailManager.h"


@implementation SocailManager

+ (instancetype)sharedManager {
    
    static SocailManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (void)startUmengShareSDK {
    
    [[UMSocialManager defaultManager] openLog:YES];
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:kUMengAppKey];
    
    [[UMSocialManager defaultManager] setUmSocialAppSecret:@""];
    
    [[SocailManager sharedManager] configUSharePlatforms];
}



- (void)configUSharePlatforms {

    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:kWechatAppKey appSecret:kWechatAppSecret redirectURL:kShareBasicUrl];
    
    /* 设置QQ的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:kQQAppKey appSecret:kQQAppSecret redirectURL:kShareBasicUrl];
    
    ///* 设置新浪的appKey和appSecret */
    //[[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];

}

- (void)shareToPlatform:(UMSocialPlatformType)platformType
               paramDic:(NSDictionary *)paramDic
             completion:(TJSShareResultCompletion)completion{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:paramDic[kShareTitle] descr:paramDic[kShareContent] thumImage:[UIImage imageNamed:paramDic[kShareImage]]];
    
    //设置网页地址
    shareObject.webpageUrl = paramDic[kShareUrl];
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:[UIViewController tjs_currentController] completion:^(id data, NSError *error) {
        
        if (error) {
            
            NSLog(@"************Share fail with error %@*********",error);
            
        }else{
            
            completion ? completion(data) : nil;
            NSLog(@"response data is %@",data);
        }
    }];
}




#pragma mark - <TJSAppService>

TJS_EXPORT_SERVICE(@"SocialService")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[SocailManager sharedManager] startUmengShareSDK];
    
    return YES;
}

// 仅支持iOS9以上系统，iOS8及以下系统不会回调
// no equiv. notification. return NO if the application can't open for some reason
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options NS_AVAILABLE_IOS(9_0){
    
    /*
     *  获得从sso或者web端回调到本app的回调
     *
     *  @param url     第三方sdk的打开本app的回调的url
     *  @param options 回调的参数
     *
     *  @return 是否处理  YES代表处理成功，NO代表不处理
     *
     *  @note 此函数在6.3版本加入
     */
  
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
    return result;
}


//2.0开始，9.0废弃，支持目前所有iOS系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url NS_DEPRECATED_IOS(2_0, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED{

    /*
     *  获得从sso或者web端回调到本app的回调
     *
     *  @param url 第三方sdk的打开本app的回调的url
     *
     *  @return 是否处理  YES代表处理成功，NO代表不处理
     */
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    return result;
}

//4.2开始，9.0废弃，支持目前所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation NS_DEPRECATED_IOS(4_2, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED{

    /*
     *  获得从sso或者web端回调到本app的回调
     *
     *  @param url               第三方sdk的打开本app的回调的url
     *  @param sourceApplication 回调的源程序
     *  @param annotation        annotation
     *
     *  @return 是否处理  YES代表处理成功，NO代表不处理
     *
     *  @note 此函数在6.3版本加入
     */
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    
    return result;
}


@end
