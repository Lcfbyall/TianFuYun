//
//  UINavigationBar+color.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FromColor)

+ (UIImage *)tjs_imageWithColor:(UIColor *)color;

+ (UIImage *)tjs_imageWithColor:(UIColor *)color
                       size:(CGSize)size;

@end
