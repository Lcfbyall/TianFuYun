//
//  UIColor+HEX.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIColor+HEX.h"

#define SF_COLOR(RED, GREEN, BLUE, ALPHA)	[UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA]
#define SF_COLORA(RED, GREEN, BLUE, ALPHA)	[UIColor colorWithRed:((float)RED / 255.0f) green:((float)GREEN / 255.0f) blue:((float)BLUE/ 255.0f) alpha:((float)ALPHA/ 255.0f)]

@implementation UIColor (HEX)


//0X2FF243
+ (instancetype)tjs_colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;
{
    CGFloat r = ((hexValue & 0x00FF0000) >> 16) / 255.0;
    CGFloat g = ((hexValue & 0x0000FF00) >> 8) / 255.0;
    CGFloat b = (hexValue & 0x000000FF) / 255.0;
    return [self colorWithRed:r green:g blue:b alpha:alpha];
}

+ (UIColor *)tjs_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}


#pragma mark - 从十六进制字符串获取颜色
#pragma mark - color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (instancetype)tjs_colorWithHexString:(NSString *)stringToConvert
{
    //删除字符串中的空格
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor redColor];;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return [UIColor redColor];
    
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    ////NSLog(@"%f:::%f:::%f",((float) r / 255.0f),((float) g / 255.0f),((float) b / 255.0f));
    
    return SF_COLOR(((float)r / 255.0f),((float)g / 255.0f),((float)b / 255.0f), 1);
}


@end
