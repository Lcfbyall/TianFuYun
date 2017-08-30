//
//  UIApplication+TJSAppAppearence.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/30.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIApplication+TJSAppAppearence.h"

@implementation UIApplication (TJSAppAppearence)

//手动更改iOS状态栏的颜色
+ (void)tjs_setStatusBarBackgroundColor:(UIColor *)color
{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}

@end
