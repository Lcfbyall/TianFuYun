//
//  ProductShareItem.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductShareItem.h"

@implementation ProductShareItem

+ (NSArray <ProductShareItem *> *)productDetailShareItems{

    ProductShareItem *wechatSession  = [ProductShareItem new];
    wechatSession.plat = UMSocialPlatformType_WechatSession;
    wechatSession.btnImage =  nil;
    wechatSession.btnTitle =  @"";
    wechatSession.btnImage_hig =  nil;
    wechatSession.btnTitle_hig = @"";
    wechatSession.btnColor = ThemeService.origin_color_00;
    wechatSession.btnColor_hig = ThemeService.weak_color_00;
    
    ProductShareItem *wechatTimeLine = [ProductShareItem new];
    wechatTimeLine.plat = UMSocialPlatformType_WechatSession;
    wechatTimeLine.btnImage =  nil;
    wechatTimeLine.btnTitle =  @"";
    wechatTimeLine.btnImage_hig =  nil;
    wechatTimeLine.btnTitle_hig = @"";
    wechatTimeLine.btnColor = ThemeService.origin_color_00;
    wechatTimeLine.btnColor_hig = ThemeService.weak_color_00;
    
    ProductShareItem *message = [ProductShareItem new];
    message.plat = UMSocialPlatformType_WechatSession;
    message.btnImage =  nil;
    message.btnTitle =  @"";
    message.btnImage_hig =  nil;
    message.btnTitle_hig = @"";
    message.btnColor = ThemeService.origin_color_00;
    message.btnColor_hig = ThemeService.weak_color_00;
    
    ProductShareItem *mail    = [ProductShareItem new];
    mail.plat = UMSocialPlatformType_WechatSession;
    mail.btnImage =  nil;
    mail.btnTitle =  @"";
    mail.btnImage_hig =  nil;
    mail.btnTitle_hig = @"";
    mail.btnColor = ThemeService.origin_color_00;
    mail.btnColor_hig = ThemeService.weak_color_00;
    
    return @[wechatSession,wechatTimeLine,message,mail];
}


@end
