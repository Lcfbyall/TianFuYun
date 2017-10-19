//
//  UIApplication+TJSAppstore.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/30.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIApplication+TJSAppstore.h"

@implementation UIApplication (TJSAppstore)

//iOS跳转到App Store下载应用评分
+ (void)tjs_schemToRating:(NSInteger)appid
{
    NSString *urlstr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%ld",(long)appid];
    NSURL *url =  [NSURL URLWithString:urlstr];
    if([[UIApplication sharedApplication] canOpenURL:url])
        [[UIApplication sharedApplication] openURL:url];
}


@end
