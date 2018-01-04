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


- (void)tjs_setBackgroundAlpha:(CGFloat)alpha
{
    for (UIView *view in self.subviews){
        
        //iOS11
        /*
        _UIBarBackground
        _UINavigationBarLargeTitleView
        _UINavigationBarContentView
        _UINavigationBarModernPromptView
         */
         view.alpha = alpha;
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


@end
