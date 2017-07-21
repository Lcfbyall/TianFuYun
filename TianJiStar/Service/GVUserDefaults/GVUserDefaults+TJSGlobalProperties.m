//
//  GVUserDefaults+TJSGlobalProperties.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "GVUserDefaults+TJSGlobalProperties.h"

@implementation GVUserDefaults (TJSGlobalProperties)

@dynamic loginName;

#pragma mark - override
- (NSDictionary *)setupDefaults {
    
    return @{
           
             @"loginName": @"",
    
             };
}

- (NSString *)transformKey:(NSString *)key {
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    return [NSString stringWithFormat:@"NSUserDefault%@", key];
}

@end
