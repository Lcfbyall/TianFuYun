//
//  ProducFilterVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProducFilterVCConfig.h"
#import "ProductFilterController.h"

@interface ProducFilterVCConfig ()

@property (nonatomic,weak) ProductFilterController *vc;

@end

@implementation ProducFilterVCConfig

- (void)setup:(ProductFilterController *)vc{
 
    _vc = vc;
    
    _vc.title = @"产品筛选";
    
    _vc.view.backgroundColor = ThemeService.origin_color_00;
    
    _vc.tjs_listView.contentInset = UIEdgeInsetsMake(Top_Height, 0,0, 0);
    
}


#pragma mark - <ProductFilterConfig>

- (void)resetBtnConfig:(UIButton *)btn{

    btn.tjs_backGroundColorNormal = ThemeService.origin_color_00;
    btn.tjs_backGroundColorHighlighted= ThemeService.weak_color_00;
    btn.tjs_titleColorNormal = ThemeService.text_color_01;
    btn.tjs_titleColorHighlighted = ThemeService.text_color_02;
    btn.tjs_titleFontNormal = [ThemeService pingFangSCMediumWithSize:16.0f];
    btn.tjs_titleNormal = @"重置";
}

- (void)sureBtnConfig:(UIButton *)btn{

    btn.tjs_backGroundColorNormal = ThemeService.main_color_01;
    btn.tjs_backGroundColorHighlighted= ThemeService.main_color_01;
    btn.tjs_titleColorNormal = ThemeService.origin_color_00;
    btn.tjs_titleColorHighlighted = ThemeService.origin_color_00;
    btn.tjs_titleFontNormal = [ThemeService pingFangSCMediumWithSize:16.0f];
    btn.tjs_titleNormal = @"确定";
}



@end
