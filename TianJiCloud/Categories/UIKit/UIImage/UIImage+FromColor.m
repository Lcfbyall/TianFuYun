//
//  UINavigationBar+color.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIImage+FromColor.h"

@implementation UIImage (FromColor)

+ (UIImage *)tjs_imageWithColor:(UIColor *)color{
    
    return [UIImage tjs_imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}


+ (UIImage *)tjs_imageWithColor:(UIColor *)color
                       size:(CGSize)size{
    
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
