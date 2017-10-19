//
//  NSDate+TJSFormated.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSDate+TJSFormated.h"

@implementation NSDate (TJSFormated)

- (NSDate *)getDaybreak
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |NSCalendarUnitMinute  | NSCalendarUnitSecond;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps        = [calendar components:unitFlags fromDate:self];

    comps.hour   = 0;
    comps.minute = 0;
    comps.second = 0;
    NSDate *date = [calendar dateFromComponents:comps];
    return date;
}

- (NSDate *)getMidnight{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |NSCalendarUnitMinute  | NSCalendarUnitSecond;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps        = [calendar components:unitFlags fromDate:self];
 
    comps.hour   = 23;
    comps.minute = 59;
    comps.second = 59;
    NSDate *date = [calendar dateFromComponents:comps];
    return date;
}


#pragma mark - Formate

+ (NSDate *)tjs_dateFromString:(NSString *)datestring
                       formate:(NSString *)formate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSDate *date = [dateFormatter dateFromString:datestring];
    return date;
}
+ (NSString *)tjs_stringFromDate:(NSDate *)date
                         formate:(NSString *)formate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSString *datestring = [dateFormatter stringFromDate:date];
    return datestring;
}
+ (NSString *)tjs_fomateString:(NSString *)datestring
                   fromFormate:(NSString *)fromFormate
                     toFormate:(NSString *)toFormate
{
    NSDate *createDate = [NSDate tjs_dateFromString:datestring formate:fromFormate];
    NSString *text = [NSDate tjs_stringFromDate:createDate formate:toFormate];
    return text;
}


@end
