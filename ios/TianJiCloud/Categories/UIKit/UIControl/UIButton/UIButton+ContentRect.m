//
//  UIButton+ContentRect.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIButton+ContentRect.h"
#import "NSObject+Swizzle.h"

@implementation UIButton (ContentRect)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tjs_swizzleInstanceMethod(
                                  [self class],
                                  @selector(intrinsicContentSize),
                                  @selector(tjs_intrinsicContentSize)
                                  
                                  );
        
        
        /*
         tjs_ObjcSwizzleMethod([self class],
         @selector(titleRectForContentRect:),
         @selector(tjs_titleRectForContentRect:));
         
         tjs_ObjcSwizzleMethod([self class],
         @selector(imageRectForContentRect:),
         @selector(tjs_imageRectForContentRect:));
         */
        
    });
}


/*
 *  intrinsicContentSize
 */
- (CGSize)tjs_intrinsicContentSize{
    
    CGSize orignal = [self tjs_intrinsicContentSize];
    if(!UIOffsetEqualToOffset(self.tjs_intrinsicOffset, UIOffsetMake(0,0))){
        
        return CGSizeMake(orignal.width+self.tjs_intrinsicOffset.horizontal*2,orignal.height+self.tjs_intrinsicOffset.vertical*2);
    }
    return orignal;
}
- (void)setTjs_intrinsicOffset:(UIOffset)tjs_intrinsicOffset{
    
    objc_setAssociatedObject(self, @selector(tjs_intrinsicOffset), [NSValue valueWithUIOffset:tjs_intrinsicOffset], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self invalidateIntrinsicContentSize];
}
- (UIOffset)tjs_intrinsicOffset{
    return [objc_getAssociatedObject(self, _cmd) UIOffsetValue];
}


/*
 //通过修改contentRectForBounds更改文字和图片的布局
 - (CGRect)tjs_titleRect{
 return [objc_getAssociatedObject(self, _cmd) CGRectValue];
 }
 - (void)setTjs_titleRect:(CGRect)rect{
 objc_setAssociatedObject(self, @selector(tjs_titleRect), [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 - (CGRect)tjs_imageRect{
 NSValue * rectValue = objc_getAssociatedObject(self, _cmd);
 return [rectValue CGRectValue];
 }
 - (void)setTjs_imageRect:(CGRect)rect{
 objc_setAssociatedObject(self, @selector(tjs_imageRect), [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 - (CGRect)tjs_titleRectForContentRect:(CGRect)contentRect{
 if (!CGRectIsEmpty(self.tjs_titleRect) &&
 !CGRectEqualToRect(self.tjs_titleRect, CGRectZero)){
 return self.tjs_titleRect;
 }
 return [self tjs_titleRectForContentRect:contentRect];
 }
 - (CGRect)tjs_imageRectForContentRect:(CGRect)contentRect{
 if (!CGRectIsEmpty(self.tjs_imageRect) &&
 !CGRectEqualToRect(self.tjs_imageRect, CGRectZero)){
 return self.tjs_imageRect;
 }
 return [self tjs_imageRectForContentRect:contentRect];
 }
 - (void)setTitleRect:(CGRect )titleRect
 ImageRect:(CGRect )imageRect{
 self.tjs_titleRect = titleRect;
 self.tjs_imageRect = imageRect;
 [self setNeedsLayout];
 [self layoutIfNeeded];
 }
 */

@end
