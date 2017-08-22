//
//  UIBarButtonItem+TJSCustom.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIBarButtonItem+TJSCustom.h"
#import "UIImage+Retinted.h"
#import "UIBarButtonItem+BlocksKit.h"


@implementation UIBarButtonItem (TJSCustom)

+ (UIBarButtonItem *)tjs_backTitleWhiteImage{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:ThemeService.origin_color_00 forState:UIControlStateNormal];
    [btn setTitleColor:ThemeService.text_color_02 forState:UIControlStateHighlighted];
    UIImage *img = [IMAGE(@"back_arrow") tjs_retintedColor:ThemeService.origin_color_00];
    [btn setImage:img forState:UIControlStateNormal];
    [btn tjs_imageTitleHorizontalAlignmentWithSpace:5];
    [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id   _Nonnull sender) {
        [UIViewController tjs_popViewControllerAnimated:YES];
    }];

    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:btn];

    return left;
}




@end
