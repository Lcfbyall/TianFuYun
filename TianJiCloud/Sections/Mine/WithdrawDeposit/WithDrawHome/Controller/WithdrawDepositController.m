//
//  WithdrawDepositController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithdrawDepositController.h"
#import "WithDrawDepositConfig.h"


@interface WithdrawDepositController ()

@property (nonatomic,strong)WithDrawDepositConfig *config;

@property (weak, nonatomic) IBOutlet UITableView *withDrawList;


@end


@implementation WithdrawDepositController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - setupConfig

- (void)setupConfig{
  
    _config = [[WithDrawDepositConfig alloc]init];
    [_config setup:self];

}


#pragma mark - setupConfigurator

- (void)setupConfigurator{



}


#pragma mark - BaseVCConfig

- (UIView *)tjs_listView{

    return _withDrawList;
}



@end
