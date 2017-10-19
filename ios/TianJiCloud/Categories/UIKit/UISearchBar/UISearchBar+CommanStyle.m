//
//  UISearchBar+CommanStyle.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UISearchBar+CommanStyle.h"

@implementation UISearchBar (CommanStyle)

+ (UIView *)tjs_customStyleWithFrame:(CGRect)frame
                    placeHolder:(NSString *)placeHolder
                    block:(void (^)(id sender))block{

    UIView *bgView = [UIView new];
    
    UIColor *bgColor = ThemeService.weak_color_00;
    bgView.frame   = frame;
    bgView.backgroundColor     = bgColor;
    bgView.layer.cornerRadius  = frame.size.height/2.0;
    bgView.layer.masksToBounds = YES;
    
    
    UISearchBar *searchBar     = [[UISearchBar alloc] init];
    searchBar.placeholder      = placeHolder;
    searchBar.frame            = bgView.bounds;
    
    searchBar.backgroundColor  = bgColor;
    searchBar.tintColor        = ThemeService.main_color_02;
    searchBar.barTintColor     = bgColor;
    
    [searchBar setSearchFieldBackgroundImage:[UIImage tjs_imageWithColor:bgColor size:searchBar.bounds.size] forState:UIControlStateNormal];
    
    [bgView addSubview:searchBar];

    
    if(block)block(searchBar);
    
    return bgView;
}

@end
