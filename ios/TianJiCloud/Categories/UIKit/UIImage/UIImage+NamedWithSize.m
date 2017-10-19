//
//  UIImage+NamedWithSize.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIImage+NamedWithSize.h"
#import "UIImage+Resizeable.h"


@implementation UIImage (NamedWithSize)

+ (UIImage *)tjs_imageNamed:(NSString *)name size:(CGSize)size{
   
    return [self tjs_imageNamed:name size:size renderingMode:UIImageRenderingModeAutomatic];
}

+ (UIImage *)tjs_imageNamed:(NSString *)name
              renderingMode:(UIImageRenderingMode)renderingMode{

    UIImage *img = [UIImage imageNamed:name];
    
    img = [img imageWithRenderingMode:renderingMode];
    
    return img;
}

+ (UIImage *)tjs_imageNamed:(NSString *)name
                       size:(CGSize)size
              renderingMode:(UIImageRenderingMode)renderingMode{
 
    UIImage *img = [UIImage imageNamed:name];
    
    img = [img imageWithRenderingMode:renderingMode];
    
    UIImage *img_resize =  [img tjs_drawInSize:size];
    
    return img_resize;
}
@end
