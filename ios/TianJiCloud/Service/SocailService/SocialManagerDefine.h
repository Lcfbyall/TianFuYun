//
//  SocialManagerDefine.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef SocialManagerDefine_h
#define SocialManagerDefine_h

static NSString * _Nullable const kShareTitle   = @"shareTitle";
static NSString * _Nullable const kShareContent = @"shareContent";
static NSString * _Nullable const kShareImage   = @"shareImage";
static NSString * _Nullable const kShareUrl     = @"shareUrl";

// 友盟 appKey
static NSString * _Nullable const kUMengAppKey     = @"";
// 友盟分享相关的 appId 、 appKey
static NSString * _Nullable const kQQAppKey        = @"";
static NSString * _Nullable const kQQAppSecret     = @"";
static NSString * _Nullable const kWechatAppKey    = @"";
static NSString * _Nullable const kWechatAppSecret = @"";
static NSString * _Nullable const kShareBasicUrl   = @"https://www.tjjf.com";


typedef void(^TJSShareResultCompletion)(_Nullable id);

#pragma mark - share type
typedef NS_ENUM(NSInteger, TJSSharePlatType) {
    
    TJSSharePlatTypeWechatSession  = UMSocialPlatformType_WechatSession,  // 微信好友
    TJSSharePlatTypeWechatTimeLine = UMSocialPlatformType_WechatTimeLine, // 微信朋友圈
    TJSSharePlatTypeQQ    = UMSocialPlatformType_QQ,         // QQ好友
    TJSSharePlatTypeSina  = UMSocialPlatformType_Sina,     //新浪微博
    TJSSharePlatTypeSms   = UMSocialPlatformType_Sms,       //短信
    TJSSharePlatTypeEmail = UMSocialPlatformType_Email,   //邮件
    
    
};




#endif /* SocialManagerDefine_h */
