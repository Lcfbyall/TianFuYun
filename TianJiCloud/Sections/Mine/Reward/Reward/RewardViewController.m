//
//  RewardViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "RewardViewController.h"

@interface RewardViewController ()


@property (weak, nonatomic) IBOutlet UIButton *historyBtn;

@end

@implementation RewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的奖励";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

    self.view.backgroundColor = ThemeService.weak_color_00;
    self.historyBtn.tjs_backGroundColorNormal = ThemeService.origin_color_00;
    self.historyBtn.tjs_backGroundColorHighlighted= ThemeService.weak_color_00;
    self.historyBtn.tjs_titleColorNormal = ThemeService.text_color_01;
    self.historyBtn.tjs_titleColorHighlighted = ThemeService.text_color_02;
    self.historyBtn.tjs_titleFontNormal = [ThemeService pingFangSCMediumWithSize:16.0f];
    self.historyBtn.tjs_titleNormal = @"查看历史奖励";
    
    [self.historyBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        [UIViewController tjs_pushViewController:HistoryRewardsVC animated:YES];
    }];
}


@end
