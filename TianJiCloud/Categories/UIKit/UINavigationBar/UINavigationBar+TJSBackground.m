//
//  UINavigationBar+TJSBackground.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UINavigationBar+TJSBackground.h"
#import <objc/runtime.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@implementation UINavigationBar (TJSBackground)

static char backgroundViewKey;
static char backgroundImageViewKey;

// set navigationBar barTintColor
- (UIView *)tjs_backgroundView
{
    return objc_getAssociatedObject(self, &backgroundViewKey);
}

- (void)setTjs_backgroundView:(UIView *)tjs_backgroundView
{
    objc_setAssociatedObject(self, &backgroundViewKey, tjs_backgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


// set navigationBar backgroundImage
- (UIImageView *)tjs_backgroundImageView
{
    return objc_getAssociatedObject(self, &backgroundImageViewKey);
}

- (void)setTjs_backgroundImageView:(UIView *)tjs_backgroundImageView
{
    objc_setAssociatedObject(self, &backgroundImageViewKey, tjs_backgroundImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark -

// set navigationBar barTintColor
- (void)tjs_setBackgroundColor:(UIColor *)backgroundColor
{
    [self.tjs_backgroundImageView removeFromSuperview];
    
    self.tjs_backgroundImageView = nil;
    
    if (self.tjs_backgroundView == nil) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.tjs_backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.tjs_backgroundView.userInteractionEnabled = NO;
        self.tjs_backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        // Should not set `UIViewAutoresizingFlexibleHeight`
        [[self.subviews firstObject] insertSubview:self.tjs_backgroundView atIndex:0];
    }
    
    self.tjs_backgroundView.backgroundColor = backgroundColor;
}

// set navigationBar backgroundImage
- (void)tjs_setBackgroundImage:(UIImage *)image
{
    [self.tjs_backgroundView removeFromSuperview];
    self.tjs_backgroundView = nil;
    
    if (self.tjs_backgroundImageView == nil)
    {
        // add a image(nil color) to _UIBarBackground make it clear
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.tjs_backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 64)];
        self.tjs_backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        // _UIBarBackground is first subView for navigationBar
        [self.subviews.firstObject insertSubview:self.tjs_backgroundImageView atIndex:0];
    }
    self.tjs_backgroundImageView.image = image;
}


// set _UIBarBackground alpha (_UIBarBackground subviews alpha <= _UIBarBackground alpha)
- (void)tjs_setBackgroundAlpha:(CGFloat)alpha
{
    UIView *barBackgroundView = self.subviews.firstObject;
    barBackgroundView.alpha = alpha;
}

- (void)tjs_setBarButtonItemsAlpha:(CGFloat)alpha{
 
    [self tjs_setBarButtonItemsAlpha:alpha hasSystemBackIndicator:NO];
}

- (void)tjs_setBarButtonItemsAlpha:(CGFloat)alpha
            hasSystemBackIndicator:(BOOL)hasSystemBackIndicator
{
    for (UIView *view in self.subviews)
    {
        if (hasSystemBackIndicator == YES)
        {
            // _UIBarBackground/_UINavigationBarBackground对应的view是系统导航栏，不需要改变其透明度
            Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
            if (_UIBarBackgroundClass != nil)
            {
                if ([view isKindOfClass:_UIBarBackgroundClass] == NO) {
                    view.alpha = alpha;
                }
            }
            
            Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
            if (_UINavigationBarBackground != nil)
            {
                if ([view isKindOfClass:_UINavigationBarBackground] == NO) {
                    view.alpha = alpha;
                }
            }
        }
        else
        {
            // 这里如果不做判断的话，会显示 backIndicatorImage
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] == NO)
            {
                Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
                if (_UIBarBackgroundClass != nil)
                {
                    if ([view isKindOfClass:_UIBarBackgroundClass] == NO) {
                        view.alpha = alpha;
                    }
                }
                
                Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
                if (_UINavigationBarBackground != nil)
                {
                    if ([view isKindOfClass:_UINavigationBarBackground] == NO) {
                        view.alpha = alpha;
                    }
                }
            }
        }
    }
}


#pragma mark -  translationY

- (void)tjs_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (CGFloat)tjs_getTranslationY
{
    return self.transform.ty;
}


#pragma mark -

- (void)tjs_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.tjs_backgroundView removeFromSuperview];
    self.tjs_backgroundView = nil;
    
    [self.tjs_backgroundImageView removeFromSuperview];
    self.tjs_backgroundImageView = nil;
}

@end
