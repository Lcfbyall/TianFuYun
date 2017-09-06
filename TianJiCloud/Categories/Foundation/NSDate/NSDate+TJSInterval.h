//
//  NSDate+TJSInterval.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TJSInterval)

- (unsigned long long)tjs_timeNanoInterval;
//00:00:00
- (unsigned long long)tjs_zeroNanoInterval;
//23:59:59
- (unsigned long long)tjs_lastNanoInterval;

+ (NSDate *)tjs_dateWithNanoIntervalSince1970:(NSTimeInterval)secs;

+ (NSString *)tjs_dateStringWithNanoIntervalYYYY_MM_DD_HH_MM:(NSTimeInterval)secs;

@end
