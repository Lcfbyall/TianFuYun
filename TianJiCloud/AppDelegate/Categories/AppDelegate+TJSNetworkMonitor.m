//
//  AppDelegate+TJSNetworkMonitor.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AppDelegate+TJSNetworkMonitor.h"
#import "AFNetworkReachabilityManager.h"

@implementation AppDelegate (TJSNetworkMonitor)

+ (void)load{

    [self monitorAFNetworkReachability];
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
