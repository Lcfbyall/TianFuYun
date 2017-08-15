//
//  ContractListConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListConfig.h"
#import "MyContractViewController.h"

@interface ContractListConfig ()

@property (nonatomic,weak)MyContractViewController *vc;

@end

@implementation ContractListConfig

- (void)setup:(MyContractViewController *)vc{
  
    _vc = vc;
    
    _vc.title = @"我的合同";

}


#pragma mark - <ContractVCConfig>

- (void)applyButtonConfig:(UIButton *)btn{
 
    btn.tjs_backGroundColorNormal     = ThemeService.btn_color_00;
    btn.tjs_backGroundColorHighlighted= ThemeService.btn_color_01;
    btn.tjs_backGroundColorDisabled   = ThemeService.btn_color_02;
    
    btn.tjs_titleColorNormal          = ThemeService.btn_color_03;
    btn.tjs_titleColorHighlighted     = ThemeService.btn_color_04;
    btn.tjs_titleColorDisabled        = ThemeService.btn_color_05;
    
    btn.tjs_titleFontNormal           = [ThemeService pingFangSCMediumWithSize:18.0f];

    btn.tjs_titleNormal = @"申请合同";
    
}


@end


