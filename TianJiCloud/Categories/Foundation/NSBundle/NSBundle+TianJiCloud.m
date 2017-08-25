//
//  NSBundle+TianJiCloud.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSBundle+TianJiCloud.h"
#import "UIDevice+CurrentArg.h"

@implementation NSBundle (TianJiCloud)


NSString * TJSLocalizedString(NSString *key){

   return  [NSBundle tjs_localizedStringForKey:key
                    bundle:[NSBundle tjs_normalBundle]];
}


+ (instancetype)tjs_normalBundle{
    
    static NSBundle *tjs_Bundle = nil;
    if(tjs_Bundle == nil){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TJSNormalBundle" ofType:@"bundle"];
        
        tjs_Bundle = [NSBundle bundleWithPath:path];
        
        // 获得所有的Bundle paths
        //NSArray *bundlePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"bundle" inDirectory:nil];
    }
    
    return tjs_Bundle;
}

+ (NSString *)tjs_localizedStringForKey:(NSString *)key
                                 bundle:(NSBundle *)bundle{
    
    return [self tjs_localizedStringForKey:key
                                     value:nil
                                    bundle:bundle];
}

+ (NSString *)tjs_localizedStringForKey:(NSString *)key
                                  value:(NSString *)value
                                 bundle:(NSBundle *)bundle{
        
    // iOS9后 zh-Hans-CN
    NSString *CU =  [UIDevice currentDevice].tjs_getPreferredLanguage;
    
    
    if(bundle == nil) bundle = [NSBundle tjs_normalBundle];
    
    NSString *language = [NSLocale preferredLanguages].firstObject;
    if ([language hasPrefix:@"en"]) {
        
        language = @"en";
        
    }else if ([language hasPrefix:@"zh"]) {
        
        
        if ([language rangeOfString:@"Hans"].location != NSNotFound) {
            
            language = @"zh-Hans"; // 简体中文
            
        } else { // zh-Hant\zh-HK\zh-TW
            
            language = @"zh-Hant"; // 繁體中文
        }
        
    } else {
        
        language = @"zh";
    }
    
    // 从.bundle中查找资源
    NSString *path = [bundle pathForResource:language ofType:@"lproj"];
    
    NSBundle *path_bundle = [NSBundle bundleWithPath:path];

    value = [path_bundle localizedStringForKey:key value:value table:nil];
    
    
    //1、处理PRODUCT_NAME
    if (value != nil && [value rangeOfString:@";#PRODUCT_NAME#;"].location != NSNotFound)
    {
        value = [value stringByReplacingOccurrencesOfString:@";#PRODUCT_NAME#;" withString:[NSBundle tjs_localizedStringForKey:@"product_name" value:@"" bundle:bundle]];
        
    }
    
    return value;
}

@end
