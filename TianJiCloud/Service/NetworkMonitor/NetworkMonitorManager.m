//
//  NetworkMonitorManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NetworkMonitorManager.h"
#import "AFNetworkReachabilityManager.h"


@implementation NetworkMonitorManager

+ (void)load{
    
    [self monitorAFNetworkReachability];
}

+ (instancetype)NetworkMonitorManager {
    
    static StatisticManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

+ (void)monitorAFNetworkReachability{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
        }
        else if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
            
            // TODO: 当前无网络连接,请检查您的网络环境
            [TJSAlertHandleUtil alertHandleWhenNetNotReachable];
        }
    }];
}

@end
