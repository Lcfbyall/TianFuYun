//
//  SocailManager.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialCore.h>

static NSString * _Nullable const kShareTitle   = @"shareTitle";
static NSString * _Nullable const kShareContent = @"shareContent";
static NSString * _Nullable const kShareImage   = @"shareImage";
static NSString * _Nullable const kShareUrl     = @"shareUrl";


typedef void(^TJSShareResultCompletion)(_Nullable id);


#pragma mark - share type
typedef NS_ENUM(NSInteger, TJSSharePlatType) {
    
    TJSSharePlatTypeWechatSession = UMSocialPlatformType_WechatSession,  // 微信好友
    TJSSharePlatTypeWechatTimeLine = UMSocialPlatformType_WechatTimeLine, // 微信朋友圈
    TJSSharePlatTypeQQ = UMSocialPlatformType_QQ,  // QQ好友
};


@interface SocailManager : NSObject<TJSAppService>

- (instancetype _Nullable)init NS_UNAVAILABLE;

- (void)shareToPlatform:(UMSocialPlatformType)platformType
               paramDic:(NSDictionary *_Nullable)paramDic
             completion:(TJSShareResultCompletion _Nullable )completion;


@end
