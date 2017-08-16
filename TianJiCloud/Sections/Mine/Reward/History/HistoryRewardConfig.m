//
//  HistoryRewardConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HistoryRewardConfig.h"
#import "HistoryRewardsController.h"

@interface HistoryRewardConfig ()

@property (nonatomic,weak)HistoryRewardsController *vc;

@end

@implementation HistoryRewardConfig

- (void)setup:(HistoryRewardsController *)vc{

    _vc = vc;
    
    _vc.title = @"历史奖励";
    
    _vc.view.backgroundColor = ThemeService.weak_color_00;
}


@end
