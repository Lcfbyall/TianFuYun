//
//  RewardViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "RewardViewController.h"
#import "RewardVCConfig.h"

@interface RewardViewController ()

@property (weak, nonatomic) IBOutlet UIButton *historyBtn;

@property (nonatomic,strong) RewardVCConfig *config;

@end


@implementation RewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupconfig];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupconfig{
  
    _config = [[RewardVCConfig alloc]init];
    
    [_config setup:self];
    [_config confighistoryBtn:self.historyBtn];
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

[super tjs_configBaseView];
    [self.historyBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        [UIViewController tjs_pushViewController:HistoryRewardsVC animated:YES];
    }];
}

@end


