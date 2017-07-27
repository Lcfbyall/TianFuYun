//
//  TJSAppInfo.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSAppInfo.h"

@implementation TJSAppInfo

//NSObject+YYModel
+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"appinfoId": @"id",@"newsVersionsNo":@"newVersionsNo"};
}


@end
