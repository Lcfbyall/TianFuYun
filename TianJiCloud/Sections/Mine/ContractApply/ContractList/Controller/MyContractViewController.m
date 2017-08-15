//
//  MyContractViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyContractViewController.h"
#import "ContractListConfig.h"
#import "ContractListConfigurator.h"

@interface MyContractViewController ()

@property (weak, nonatomic) IBOutlet UITableView *contractlist;

@property (weak, nonatomic) IBOutlet UIButton *applyBtn;


@property (nonatomic,strong) ContractListConfig *config;

@property (nonatomic,strong) ContractListConfigurator *configurator;

@property (nonatomic,strong) id<ContractListInteractor>interactor;


@end

@implementation MyContractViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的合同";
    
    [self setupConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void)setupConfig{

    _config = [[ContractListConfig alloc]init];
    
    [_config applyButtonConfig:self.applyBtn];
    
    [_config setup:self];
}


- (void)setupConfigurator{

    _configurator = [[ContractListConfigurator alloc]init];

    [_configurator setup:self];
    
}


#pragma mark - <ContractListInteractorDelegate>




#pragma mark - <TJSBaseTableViewCellDelegate>

- (BOOL)onTapCell:(id)value{

    [UIViewController tjs_pushViewController:ContractDetailVC params:@{}  animated:YES];
    
    return YES;
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{
 
    [self.applyBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        [UIViewController tjs_pushViewController:ContractApplyVC animated:YES];
        
    }];
    
}

- (UIView *)tjs_listView{

    return _contractlist;
}



@end
