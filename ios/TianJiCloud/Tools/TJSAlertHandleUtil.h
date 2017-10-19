//
//  TJSAlertHandleUtil.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJSAlertHandleUtil : NSObject

+ (void)alertHandleWhenNetNotReachable;

+ (void)alertHandleCallManager:(NSString *)name;

+ (void)alertHandleWhenCallNotAvailableOnSimulator;

+ (void)actionSheetHandleWhenUploadProfileIcon:(void (^)(id))block;

@end
