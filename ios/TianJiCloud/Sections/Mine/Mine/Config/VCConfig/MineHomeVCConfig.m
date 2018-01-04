//
//  MineHomeVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeVCConfig.h"
#import "MineViewController.h"
#import "UIImage+Resizeable.h"
#import "UIImage+Combination.h"

@interface MineHomeVCConfig ()

@property (nonatomic,weak) MineViewController *vc;


@end

@implementation MineHomeVCConfig

#pragma mark - controller settings

- (void)setup:(MineViewController *)vc{

    _vc = vc;
    _vc.params =  [UINavigationBar translucentWhiteTint];
    
    [_vc tjs_configViewController];

}


#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{
    
    NSString *leftBarBtnImage = @"manager";
    UIImage *img = IMAGEOriginal(leftBarBtnImage);
    UIImage *conbineImg = img;
    WEAK_SELF(self);
    UIBarButtonItem *leftItem  = [[UIBarButtonItem alloc] bk_initWithImage:conbineImg style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            if([self.vc conformsToProtocol:@protocol(MineHomeVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapLeftBarBtnToSettingList:)]){
                [self.vc onTapLeftBarBtnToSettingList:sender];
            }
        }
    }];
    
    NSArray *leftBarButtonItems = _vc.navigationItem.leftBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [leftBarButtonItems mutableCopy];
    [mutable addObject:leftItem];
    return [mutable copy];
}

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    NSString *rightBarBtnImage = @"hide_money";
    NSString *rightBarTitle = @"隐藏金额";
    NSString *rightBarBtnImage_sel = @"show_money";
    NSString *rightBarTitle_sel = @"显示金额";
    UIImage *img = [[IMAGE(rightBarBtnImage) tjs_drawInSize:CGSizeMake(17, 14)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img_sel = [[IMAGE(rightBarBtnImage_sel) tjs_drawInSize:CGSizeMake(17, 14)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0,100, 40);
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [btn setTitleColor:ThemeService.origin_color_00 forState:UIControlStateNormal];
    [btn setTitleColor:ThemeService.text_color_02 forState:UIControlStateHighlighted];
    [btn setTitle:rightBarTitle forState:UIControlStateNormal];
    [btn setTitle:rightBarTitle_sel forState:UIControlStateSelected];
    [btn setImage:img forState:UIControlStateNormal];
    [btn setImage:img_sel forState:UIControlStateSelected];
    
    [btn tjs_imageTitleHorizontalAlignmentWithSpace:5];
    WEAK_SELF(self);
    [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id   _Nonnull sender) {
        STRONG_SELF(self);
        if(self){
            ((UIButton *)sender).selected = !((UIButton *)sender).selected;
            if([self.vc conformsToProtocol:@protocol(MineHomeVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapRightBarBtnToHideOrShowSum:)]){
                [self.vc onTapRightBarBtnToHideOrShowSum:sender];
            }
        }
    }];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    return [mutable copy];
}

@end

