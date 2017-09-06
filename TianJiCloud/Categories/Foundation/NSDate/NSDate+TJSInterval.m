//
//  NSDate+TJSInterval.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSDate+TJSInterval.h"
#import "NSDate+TJSFormated.h"

@implementation NSDate (TJSInterval)

- (unsigned long long)tjs_timeNanoInterval{
    
   return [self timeIntervalSince1970] * 1000;
}

//00:00:00
- (unsigned long long)tjs_zeroNanoInterval{
    
    return [[self getDaybreak] tjs_timeNanoInterval];
}

//23:59:59
- (unsigned long long)tjs_lastNanoInterval{
    
    return [[self getMidnight] tjs_timeNanoInterval];
}
 
+ (NSDate *)tjs_dateWithNanoIntervalSince1970:(NSTimeInterval)secs{

    return [NSDate dateWithTimeIntervalSince1970:secs/1000.0];
}

+ (NSString *)tjs_dateStringWithNanoIntervalYYYY_MM_DD_HH_MM:(NSTimeInterval)secs{

    NSDate *date = [NSDate tjs_dateWithNanoIntervalSince1970:secs];
    
    NSString *dateStr = [NSDate tjs_stringFromDate:date formate:@"yyyy-MM-dd HH-mm"];
    
    return dateStr;
}



@end
