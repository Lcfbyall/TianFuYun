//
//  NSBundle+TianJiCloud.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSBundle+TianJiCloud.h"

@implementation NSBundle (TianJiCloud)

+ (instancetype)tjs_normalBundle
{

    static NSBundle *tjs_Bundle = nil;
    if(tjs_Bundle == nil){
    
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tjs_bundle" ofType:@"bundle"];
        tjs_Bundle = [NSBundle bundleWithPath:path];
    
    }
    
    return tjs_Bundle;
}


+ (NSString *)tjs_localizedStringForKey:(NSString *)key
{
    return [self tjs_localizedStringForKey:key value:nil];
}

+ (NSString *)tjs_localizedStringForKey:(NSString *)key value:(NSString *)value
{

    static NSBundle *bundle = nil;
    
    if (bundle == nil) {
        // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            
            language = @"en";
        }
        else if ([language hasPrefix:@"zh"]) {
            
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                
                language = @"zh-Hans"; // 简体中文
                
            } else { // zh-Hant\zh-HK\zh-TW
                
                language = @"zh-Hant"; // 繁體中文
            }
            
        } else {
            
            language = @"en";
        }
        
        // 从MJRefresh.bundle中查找资源
        bundle = [NSBundle bundleWithPath:[[NSBundle tjs_normalBundle] pathForResource:language ofType:@"lproj"]];
    }
    
    value = [bundle localizedStringForKey:key value:value table:nil];
    
    value =  [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
    
    
    //1、处理PRODUCT_NAME
    if (value != nil && [value rangeOfString:@";#PRODUCT_NAME#;"].location != NSNotFound)
    {
        value = [value stringByReplacingOccurrencesOfString:@";#PRODUCT_NAME#;" withString:[NSBundle tjs_localizedStringForKey:@"product_name" value:@""]];
    }
    
    return value;
}

@end
