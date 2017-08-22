//
//  CumulativeInvestController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestController.h"
#import "CumulativeInvestConfig.h"
#import "CumulativeInvestConfigurator.h"

@interface CumulativeInvestController ()

@property (nonatomic,strong)CumulativeInvestConfig *config;

@property (nonatomic,strong)CumulativeInvestConfigurator *configurator;

@property (nonatomic,strong) id<CumulativeInvestInteractor> interactor;


@property (weak, nonatomic) IBOutlet UITableView *investList;

@end

@implementation CumulativeInvestController

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


#pragma mark - setupConfig

- (void)setupConfig{

    _config = [[CumulativeInvestConfig alloc]init];
    [_config setup:self];
    
}


#pragma mark - setupConfigurator

- (void)setupConfigurator{

   _configurator = [[CumulativeInvestConfigurator alloc]init];
    
    [_configurator setup:self];
    
}



#pragma mark - <TJSBaseVCConfig>

- (UIView *)tjs_listView{
  
    return _investList;
}

@end
