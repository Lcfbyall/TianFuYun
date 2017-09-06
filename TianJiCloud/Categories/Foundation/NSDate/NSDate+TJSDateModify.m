//
//  NSDate+TJSDateModify.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSDate+TJSDateModify.h"

@implementation NSDate (TJSDateModify)



- (nullable NSDate *)tjs_dateByAddingComponents:(NSDateComponents *_Nullable)components
{
    
    NSCalendar *calendar    = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags   =
                            NSCalendarUnitYear   |
                            NSCalendarUnitMonth  |
                            NSCalendarUnitDay    |
                            NSCalendarUnitHour   |
                            NSCalendarUnitMinute |
                            NSCalendarUnitSecond ;
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps                   = [calendar components:unitFlags fromDate:self];
    
    comps.hour              += components.hour;
    comps.minute            += components.minute;
    comps.second            += components.second;
    
    return  [calendar dateFromComponents:comps];
    
}

- (NSDate *)tjs_dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)tjs_dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)tjs_dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)tjs_dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)tjs_dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)tjs_dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)tjs_dateByAddingSeconds:(NSInteger)seconds {
    
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}



@end
