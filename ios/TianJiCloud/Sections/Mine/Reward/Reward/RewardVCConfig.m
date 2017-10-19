//
//  RewardVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "RewardVCConfig.h"
#import "RewardViewController.h"

@interface RewardVCConfig ()

@property (nonatomic,weak) RewardViewController *vc;

@end

@implementation RewardVCConfig

- (void)setup:(RewardViewController *)vc{
 
    _vc = vc;

    _vc.title = @"我的奖励";
    _vc.view.backgroundColor = ThemeService.weak_color_00;
    
}


#pragma mark - <RewardConfig>

- (void)confighistoryBtn:(UIButton *)btn{

    btn.tjs_backGroundColorNormal = ThemeService.origin_color_00;
    btn.tjs_backGroundColorHighlighted= ThemeService.weak_color_00;
    btn.tjs_titleColorNormal = ThemeService.text_color_01;
    btn.tjs_titleColorHighlighted = ThemeService.text_color_02;
    btn.tjs_titleFontNormal = [ThemeService pingFangSCMediumWithSize:16.0f];
    btn.tjs_titleNormal = @"查看历史奖励";

}



@end
