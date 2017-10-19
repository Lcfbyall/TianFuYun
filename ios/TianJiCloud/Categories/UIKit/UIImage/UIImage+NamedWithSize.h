//
//  UIImage+NamedWithSize.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NamedWithSize)

+ (UIImage *)tjs_imageNamed:(NSString *)name size:(CGSize)size;

+ (UIImage *)tjs_imageNamed:(NSString *)name
              renderingMode:(UIImageRenderingMode)renderingMode;


+ (UIImage *)tjs_imageNamed:(NSString *)name
                       size:(CGSize)size
              renderingMode:(UIImageRenderingMode)renderingMode;

@end
