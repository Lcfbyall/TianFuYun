//
//  UIColor+HEX.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

//0X2FF243
+ (instancetype)tjs_colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;

+ (UIColor *)tjs_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

#pragma mark - 从十六进制字符串获取颜色
#pragma mark - color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (instancetype)tjs_colorWithHexString:(NSString *)stringToConvert;


@end
