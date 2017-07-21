//
//  UITextView+EditRect.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITextView+EditRect.h"
#import "NSObject+Swizzle.h"

@implementation UITextView (EditRect)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //
        tjs_swizzleInstanceMethod([self class],
                              @selector(leftViewRectForBounds:),
                              @selector(tjs_leftViewRectForBounds:));
        
        
        tjs_swizzleInstanceMethod([self class],
                              @selector(placeholderRectForBounds:),
                              @selector(tjs_placeholderRectForBounds:));
        
    });
    
}


/**
 *  leftView
 */
- (CGRect)tjs_leftViewRectForBounds:(CGRect)bounds
{
    if (!CGRectIsEmpty(self.tjs_leftViewRect) &&
        !CGRectEqualToRect(self.tjs_leftViewRect, CGRectZero))
    {
        return self.tjs_leftViewRect;
    }
    return [self tjs_leftViewRectForBounds:bounds];
}

/**
 * 占位提示语缩进
 */
- (CGRect)tjs_placeholderRectForBounds:(CGRect)bounds
{
    bounds = [self tjs_placeholderRectForBounds:bounds];
    
    if(self.tjs_placeHolderHeadIndent>0){
        
        return CGRectInset(bounds, self.tjs_placeHolderHeadIndent, 0);
    }
    
    return CGRectInset(bounds,3, 0);
}


#pragma mark getter and setters
- (CGRect)tjs_leftViewRect
{
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}
- (void)setTjs_leftViewRect:(CGRect)tjs_leftViewRect
{
    objc_setAssociatedObject(self, @selector(tjs_leftViewRect), [NSValue valueWithCGRect:tjs_leftViewRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)tjs_placeHolderHeadIndent
{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
- (void)setTjs_placeHolderHeadIndent:(CGFloat)placeHolderHeadIndent
{
    objc_setAssociatedObject(self, @selector(tjs_placeHolderHeadIndent),[NSNumber numberWithDouble:placeHolderHeadIndent] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
