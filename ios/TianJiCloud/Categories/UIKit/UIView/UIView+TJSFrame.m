//
//  UIView+TJSFrame.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/26.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIView+TJSFrame.h"

@implementation UIView (TJSFrame)


/*
 *  坐标处理
 */
// Retrieve and set the origin
- (CGPoint)tjs_origin
{
    return self.frame.origin;
}
- (void)setTjs_origin:(CGPoint)aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}
// Retrieve and set the size
- (CGSize)tjs_size
{
    return self.frame.size;
}
- (void)setTjs_size:(CGSize)aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}
// Query other frame locations
- (CGPoint)tjs_bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}
- (CGPoint) tjs_bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}
- (CGPoint) tjs_topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) tjs_height
{
    return self.frame.size.height;
}
- (void)setTjs_height:(CGFloat)newheight
{
    CGRect newframe      = self.frame;
    newframe.size.height = newheight;
    self.frame           = newframe;
}
- (CGFloat)tjs_width
{
    return self.frame.size.width;
}
- (void)setTjs_width:(CGFloat)newwidth
{
    CGRect newframe     = self.frame;
    newframe.size.width = newwidth;
    self.frame          = newframe;
}
- (CGFloat)tjs_top
{
    return self.frame.origin.y;
}
- (void)setTjs_top:(CGFloat)newtop
{
    CGRect newframe   = self.frame;
    newframe.origin.y = newtop;
    self.frame        = newframe;
}
- (CGFloat)tjs_left
{
    return self.frame.origin.x;
}
- (void)setTjs_left:(CGFloat)newleft
{
    CGRect newframe   = self.frame;
    newframe.origin.x = newleft;
    self.frame        = newframe;
}
- (CGFloat)tjs_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setTjs_bottom:(CGFloat)newbottom
{
    CGRect newframe   = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame        = newframe;
}
- (CGFloat)tjs_right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setTjs_right:(CGFloat)newright
{
    CGFloat delta      = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe    = self.frame;
    newframe.origin.x += delta ;
    self.frame         = newframe;
}
// Move via offset
- (void)moveBy:(CGPoint)delta
{
    CGPoint newcenter = self.center;
    newcenter.x      += delta.x;
    newcenter.y      += delta.y;
    self.center       = newcenter;
}
// Scaling
- (void)scaleBy:(CGFloat)scaleFactor
{
    CGRect newframe       = self.frame;
    newframe.size.width  *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame            = newframe;
}

//Ensure that both dimensions fit within the given size by scaling down
- (void)fitInSize:(CGSize)aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;
}


@end
