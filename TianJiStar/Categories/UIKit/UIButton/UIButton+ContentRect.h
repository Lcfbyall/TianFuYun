//
//  UIButton+ContentRect.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ContentRect)

/*
 *   自动布局默认空出的距离 ，一般左右相等，上下相等
 */
@property(nonatomic,assign)UIOffset tjs_intrinsicOffset;

/*
 //通过修改contentRectForBounds更改文字和图片的布局
 @property (nonatomic,assign) CGRect tjs_titleRect;
 @property (nonatomic,assign) CGRect tjs_imageRect;
 - (void)setTitleRect:(CGRect )titleRect
 ImageRect:(CGRect )imageRect;
 */

@end
