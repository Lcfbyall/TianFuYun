//
//  GVUserDefaults+TJSGlobalProperties.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "GVUserDefaults.h"

@interface GVUserDefaults (TJSGlobalProperties)


// 当前登录名
@property (nonatomic, copy) NSString *loginName;


// token
@property (nonatomic, copy) NSString *token;

@end
