//
//  UINavigationBar+color.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FromColor)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size;

@end
