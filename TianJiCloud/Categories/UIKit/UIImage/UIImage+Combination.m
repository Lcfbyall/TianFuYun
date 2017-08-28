//
//  UIImage+Combination.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIImage+Combination.h"

@implementation UIImage (Combination)

- (UIImage *)tjs_combinateWithImage:(UIImage *)img
                            size:(CGSize)size
                            subrect:(CGRect)subrect{
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 1);
    CGRect imgRect = CGRectMake(0, 0, size.width,size.height);
    
    [self drawInRect:imgRect];
    
    //[img drawInRect:subrect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
