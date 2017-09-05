//
//  NetworkMonitorManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NetworkMonitorManager.h"
#import "AFNetworkReachabilityManager.h"
#import <CoreTelephony/CTCellularData.h>
//http://www.cocoachina.com/ios/20161125/18181.html
@implementation NetworkMonitorManager

+ (void)load{
    
    [self requestForAuthorize];
    [self monitorAFNetworkReachability];
}

+ (instancetype)NetworkMonitorManager {
    
    static NetworkMonitorManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}



#pragma mark - 请求权限

+ (void)requestForAuthorize{

    CTCellularData *cellularData = [[CTCellularData alloc]init];
    
    //受限制的状态
    CTCellularDataRestrictedState state = cellularData.restrictedState;
    
    [self handleState:state];

    cellularData.cellularDataRestrictionDidUpdateNotifier =  ^(CTCellularDataRestrictedState state){
    
        [self handleState:state];
    };
}

+ (void)handleState:(CTCellularDataRestrictedState)state{
 
    if(state== kCTCellularDataRestrictedStateUnknown){
        
        
    }
    
    //关闭或者无限局域网
    else if(state == kCTCellularDataRestricted){
        
        
        
    }
    //不受限制，无线局域网与蜂窝移动数据
    else{
        
        
    }
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
