//
//  UIImage+ColorAtPixel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorAtPixel)

//取图片某一像素点的颜色
- (UIColor *)tjs_colorAtPixel:(CGPoint)point;


@end
