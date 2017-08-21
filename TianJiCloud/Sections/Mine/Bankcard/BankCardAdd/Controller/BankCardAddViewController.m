//
//  BankCardAddViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddViewController.h"
#import "BankCardAddConfig.h"
#import "BankCardAddConfigurator.h"

@interface BankCardAddViewController ()

@property (nonatomic,strong) BankCardAddConfig *config;

@property (nonatomic,strong) BankCardAddConfigurator *configurator;

@property (nonatomic,strong) id <BankCardAddInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *addlist;

@end


@implementation BankCardAddViewController

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

    _config = [[BankCardAddConfig alloc]init];
    
    [_config setup:self];

}

#pragma mark - setupConfigurator

- (void)setupConfigurator{

    _configurator = [[BankCardAddConfigurator alloc]init];
    [_configurator setup:self];
    
    [self.interactor configWithBankCardInfo:nil];
 
}


#pragma mark - <TJSBaseVCConfig>

- (UIView *)tjs_listView{

    return _addlist;
}


#pragma mark - <TJSBaseTableViewCellDelegate>

- (BOOL)onTapCell:(id)value{

    [self.interactor showBank];
    
    return YES;
}


@end
