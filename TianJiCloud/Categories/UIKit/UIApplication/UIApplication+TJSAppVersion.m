//
//  UIApplication+TJSAppVersion.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIApplication+TJSAppVersion.h"


@implementation UIApplication (TJSAppVersion)

+ (NSString *)tjs_appverison{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version  = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}
+ (NSString *)tjs_abundleVersion{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *buildNo =[infoDictionary objectForKey:@"CFBundleVersion"];
    return buildNo;
}

@end
