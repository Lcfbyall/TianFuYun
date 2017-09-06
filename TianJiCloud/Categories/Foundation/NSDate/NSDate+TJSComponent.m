//
//  NSDate+TJSComponent.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSDate+TJSComponent.h"
#import "NSDate+TJSDateModify.h"


@implementation NSDate (TJSComponent)

- (NSInteger)tyear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)tmonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)tday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)thour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)tminute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)tsecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)tnanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)tdayOfYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger dayIndexOfYear =  [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:self];
    return dayIndexOfYear;
}

- (NSInteger)tdaysOfMonth
{
    NSCalendar *calendar  = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange ra =  [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return ra.length;
}

- (NSInteger)tdaysOfQuarter{
  
    NSCalendar *calendar  = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange ra =  [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitQuarter forDate:self];
    return ra.length;
}

- (NSInteger)tdaysOfYear
{
    NSCalendar *calendar  = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange ra =  [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:self];
    return ra.length;
}

- (NSInteger)tweekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

//表示WeekDay在下一个更大的日历单元中的位置。例如WeekDay=3，WeekDayOrdinal=2  就表示这个月的第2个周二。
- (NSInteger)tweekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)tweekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)tweekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)tyearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)tweeksOfMonth{
    
    NSCalendar *calendar  = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange ra =  [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitMonth forDate:self];
    return ra.length;
}
- (NSInteger)tweeksOfQuarter{
    
    NSCalendar *calendar  = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange ra =  [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitQuarter forDate:self];
    return ra.length;
}
- (NSInteger)tweeksOfYear{
    
    NSCalendar *calendar  = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange ra =  [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:self];
    return ra.length;
}


- (NSInteger)tquarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (BOOL)tisLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)tisLeapYear {
    NSUInteger year = self.tyear;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)tisToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].tday == self.tday;
}

- (BOOL)tisYesterday {
    NSDate *added = [self tjs_dateByAddingDays:1];
    return [added tisToday];
}


@end
