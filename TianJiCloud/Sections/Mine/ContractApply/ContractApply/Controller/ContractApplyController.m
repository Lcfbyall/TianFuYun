//
//  ContractApplyController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyController.h"
#import "ContractApplyConfigurator.h"

@interface ContractApplyController ()

@property (weak, nonatomic) IBOutlet UITableView *applylist;

@property (nonatomic,strong)ContractApplyConfigurator *configurator;

@property (nonatomic,strong) id <ContractApplyInteractor>  interactor;

@end

@implementation ContractApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"合同申请";
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


#pragma mark - setupConfig

- (void)setupConfigurator{
 
    _configurator = [[ContractApplyConfigurator alloc]init];
    
    [_configurator setup:self];

}


#pragma mark - <TJSBaseVCConfig>

- (UIView *)tjs_listView{
 
    return self.applylist;
}


@end
