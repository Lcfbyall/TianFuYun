//
//  LocationManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "LocationManager.h"

@interface LocationManager ()


@end

@implementation LocationManager

+ (LocationManager *)shareManager {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}



@end
