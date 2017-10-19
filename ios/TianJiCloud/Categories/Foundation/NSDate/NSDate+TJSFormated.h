//
//  NSDate+TJSFormated.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 G: 公元时代，例如AD公元
 yy: 年的后2位
 yyyy: 完整年
 MM: 月，显示为1-12
 MMM: 月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd: 日，2位数表示，如02
 d: 日，1-2位显示，如 2
 EEE: 简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa: 上下午，AM/PM
 H: 时，24小时制，0-23
 K：时，12小时制，0-11
 m: 分，1-2位
 mm: 分，2位
 s: 秒，1-2位
 ss: 秒，2位
 S: 毫秒
 */

@interface NSDate (TJSFormated)

- (NSDate *)getDaybreak;

- (NSDate *)getMidnight;

+ (NSDate *)tjs_dateFromString:(NSString *)datestring
                       formate:(NSString *)formate;

+ (NSString *)tjs_stringFromDate:(NSDate *)date
                         formate:(NSString *)formate;

+ (NSString *)tjs_fomateString:(NSString *)datestring
                   fromFormate:(NSString *)fromFormate
                     toFormate:(NSString *)toFormate;



@end
