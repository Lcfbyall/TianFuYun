//
//  WithDrawDepositController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositController.h"
#import "WithDrawDepositConfig.h"
#import "WithDrawDepositConfigurator.h"

@interface WithDrawDepositController ()

@property (nonatomic,strong)WithDrawDepositConfig *config;

@property (nonatomic,strong) WithDrawDepositConfigurator *configurator;
@property (nonatomic,strong) id <WithDrawDepositInteractor> interactor;
@property (weak, nonatomic) IBOutlet UITableView *withDrawList;


@end


@implementation WithDrawDepositController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    
}

#pragma mark - setupConfig

- (void)setupConfig{
  
    _config = [[WithDrawDepositConfig alloc]init];
    [_config setup:self];
}


#pragma mark - setupConfigurator

- (void)setupConfigurator{

    _configurator = [[WithDrawDepositConfigurator alloc]init];
    [_configurator setup:self];
    [self.interactor configWithData:nil];

}


#pragma mark - BaseVCConfig

- (UIScrollView *)tjs_listView{

    return _withDrawList;
}



@end
