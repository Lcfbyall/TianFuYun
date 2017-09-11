//
//  UINavigationBar+StyleConfigure.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (StyleConfigure)

/*
- (void)setupStyleBasic;

- (void)setupStyleBasicTranslucent;

- (void)setupStyleBasicWithBarTintColor:(UIColor *)barTintColor;

- (void)setupStyleBasicTranslucentWithBarTintColor:(UIColor *)barTintColor;

- (void)setupStyleWithTitleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont
                    barTintColor:(UIColor *)barTintColor
                       tintColor:(UIColor *)tintColor
                     translucent:(BOOL)translucent;
*/

+ (NSDictionary *)basicStyleWhite;

+ (NSDictionary *)translucentWhiteTint;



@end
