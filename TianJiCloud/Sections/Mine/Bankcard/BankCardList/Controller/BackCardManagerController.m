//
//  BackCardManagerController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BackCardManagerController.h"
#import "BankCardListConfig.h"
#import "BankCardListConfigurator.h"


@interface BackCardManagerController ()

@property (nonatomic,strong) BankCardListConfig *config;

@property (nonatomic,strong) BankCardListConfigurator *configurator;

@property (nonatomic,strong) id <BankCardListInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *bankCardList;


@end

@implementation BackCardManagerController

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


#pragma mark -  setupConfig

- (void)setupConfig{
    
    _config = [[BankCardListConfig alloc]init];
    
    [_config setup:self];

}


#pragma mark - setupConfigurator

- (void)setupConfigurator{

    _configurator = [[BankCardListConfigurator alloc]init];

    [_configurator setup:self];
    
}


#pragma mark - <TJSBaseVCConfig>

- (UIView *)tjs_listView{
 
    return _bankCardList;
}


@end



