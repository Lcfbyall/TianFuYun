//
//  UINavigationBar+TJSBackground.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

//http://www.jianshu.com/p/540a7e6f7b40

@interface UINavigationBar (TJSBackground)

- (void)tjs_setBackgroundColor:(UIColor *)backgroundColor;
- (void)tjs_setBackgroundImage:(UIImage *)image;

- (void)tjs_setBackgroundAlpha:(CGFloat)alpha;
- (void)tjs_setBarButtonItemsAlpha:(CGFloat)alpha;
- (void)tjs_setTranslationY:(CGFloat)translationY;
- (void)tjs_reset;


@end
