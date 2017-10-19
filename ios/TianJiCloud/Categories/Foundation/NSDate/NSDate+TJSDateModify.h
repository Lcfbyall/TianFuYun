//
//  NSDate+TJSDateModify.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TJSDateModify)

- (nullable NSDate *)tjs_dateByAddingComponents:(NSDateComponents *_Nullable)components;

- (nullable NSDate *)tjs_dateByAddingYears:(NSInteger)years;


- (nullable NSDate *)tjs_dateByAddingMonths:(NSInteger)months;


- (nullable NSDate *)tjs_dateByAddingWeeks:(NSInteger)weeks;


- (nullable NSDate *)tjs_dateByAddingDays:(NSInteger)days;


- (nullable NSDate *)tjs_dateByAddingHours:(NSInteger)hours;


- (nullable NSDate *)tjs_dateByAddingMinutes:(NSInteger)minutes;


- (nullable NSDate *)tjs_dateByAddingSeconds:(NSInteger)seconds;


@end
