//
//  EventKitManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "EventKitManager.h"

@interface EventKitManager ()


@end

@implementation EventKitManager

+ (EventKitManager *)shareManager {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}


#pragma mark - do sth

- (void)calendar{
  
    [EventKitManager requestForAuthorize:^(BOOL granted) {
       
        if(granted){
        
            
        }else{
        
        
        }
        
    }];
}

#pragma mark - 请求权限

+ (void)requestForAuthorize:(void(^)(BOOL granted))complete{

    EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeEvent];

    if(EKstatus == EKAuthorizationStatusNotDetermined){
        
        EKEventStore *store = [[EKEventStore alloc]init];
        [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(complete)complete(granted);
            });
        }];
    }else if (EKstatus == EKAuthorizationStatusRestricted||
              EKstatus == EKAuthorizationStatusDenied){
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(complete)complete(NO);
        });
    }else{
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(complete)complete(YES);
        });
    }

}

@end

