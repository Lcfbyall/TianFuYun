//
//  UINavigationBar+StyleConfigure.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (StyleConfigure)


/**
 项目默认效果
 */
- (void)setupStyleBasic;

- (void)setupStyleBasicWithBarTintColor:(UIColor *)barTintColor;

- (void)setupStyleWithTitleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont
                    barTintColor:(UIColor *)barTintColor
                       tintColor:(UIColor *)tintColor
                     translucent:(BOOL)translucent;

@end
