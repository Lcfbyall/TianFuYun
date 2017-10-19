//
//  AddressBookManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressBookManager.h"

@interface AddressBookManager ()


@end

@implementation AddressBookManager

+ (AddressBookManager *)shareManager {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

#pragma mark - 开始获取通讯录

- (void)start{

    [self requestForAuthorize:^(BOOL granted) {
        
        if(granted){
        
            
            
        }else{
        
        
        }
    }];
}
    
#pragma mark - 请求权限
    
- (void)requestForAuthorize:(void(^)(BOOL granted))complete{

    ABAuthorizationStatus authorizestatus = ABAddressBookGetAuthorizationStatus();

    if(authorizestatus==kABAuthorizationStatusNotDetermined){
        
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        
            CFRelease(addressBook);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(complete)complete(granted);
            });
        });
    }else if (authorizestatus==kABAuthorizationStatusRestricted ||
              authorizestatus == kABAuthorizationStatusDenied){
    
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
