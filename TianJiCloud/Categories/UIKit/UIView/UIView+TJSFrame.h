//
//  UIView+TJSFrame.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/26.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TJSFrame)

/*
 *  坐标处理
 */
@property CGPoint tjs_origin;
@property CGSize tjs_size;
@property (readonly) CGPoint tjs_bottomLeft;
@property (readonly) CGPoint tjs_bottomRight;
@property (readonly) CGPoint tjs_topRight;
@property CGFloat tjs_height;
@property CGFloat tjs_width;
@property CGFloat tjs_top;
@property CGFloat tjs_left;
@property CGFloat tjs_bottom;
@property CGFloat tjs_right;

- (void)moveBy:(CGPoint)delta;
- (void)scaleBy:(CGFloat)scaleFactor;
- (void)fitInSize:(CGSize)aSize;


@end
