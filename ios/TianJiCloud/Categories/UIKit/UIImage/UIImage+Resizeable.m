//
//  UIImage+Resizeable.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIImage+Resizeable.h"

@implementation UIImage (Resizeable)

- (UIImage *)tjs_drawInSize:(CGSize)size{
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGRect imgRect = CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:imgRect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
