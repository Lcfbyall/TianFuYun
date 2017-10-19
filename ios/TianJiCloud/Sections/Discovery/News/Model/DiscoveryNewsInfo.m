//
//  DiscoveryNewsInfo.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryNewsInfo.h"

@implementation DiscoveryNewsInfo

//NSObject+YYModel
+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{
             @"newsid": @"id",
             };
}

@end
