//
//  NSDate+TJSComponent.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TJSComponent)


@property (nonatomic, readonly) NSInteger tyear; ///< Year component
@property (nonatomic, readonly) NSInteger tmonth; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger tday; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger thour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger tminute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger tsecond; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger tnanosecond; ///< Nanosecond component
@property (nonatomic,readonly) NSInteger tdayOfYear;

@property (nonatomic,readonly) NSInteger tdaysOfMonth;
@property (nonatomic,readonly) NSInteger tdaysOfQuarter;
@property (nonatomic,readonly) NSInteger tdaysOfYear;

@property (nonatomic, readonly) NSInteger tweekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger tweekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger tweekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger tweekOfYear; ///< WeekOfYear component (1~53)

@property (nonatomic,readonly) NSInteger tweeksOfMonth;
@property (nonatomic,readonly) NSInteger tweeksOfQuarter;
@property (nonatomic,readonly) NSInteger tweeksOfYear;

@property (nonatomic, readonly) NSInteger tyearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger tquarter; ///< Quarter component
@property (nonatomic, readonly) BOOL tisLeapMonth; ///< Weather the month is leap month
@property (nonatomic, readonly) BOOL tisLeapYear; ///< Weather the year is leap year
@property (nonatomic, readonly) BOOL tisToday; ///< Weather date is today (based on current locale)
@property (nonatomic, readonly) BOOL tisYesterday; ///< Weather date is yesterday (based on current locale)


@end
