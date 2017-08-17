//
//  AddressSelectController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectController.h"
#import "AddressSelectedConfig.h"
#import "AddressSelectedConfigurator.h"

@interface AddressSelectController ()

@property (nonatomic,strong)AddressSelectedConfig *config;

@property (nonatomic,strong)AddressSelectedConfigurator *configurator;

@property (nonatomic,strong) id <AddressSelectedInteractor>  interactor;


@property (weak, nonatomic) IBOutlet UITableView *addreslist;

@end

@implementation AddressSelectController

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

- (void)setupConfig{
 
    _config = [[AddressSelectedConfig alloc]init];
    
    [_config setup:self];
    
    self.navigationItem.rightBarButtonItems = [_config tjs_rightBarButtonItems];

}


- (void)setupConfigurator{
 
    _configurator = [[AddressSelectedConfigurator alloc]init];

    [_configurator setup:self];
}


- (UIView *)tjs_listView{
  
    return _addreslist;
}


#pragma mark - <AddressSelectedConfig>

- (void)onTapRightBarBtnToAddressManage:(id)sender{
 
    [UIViewController tjs_pushViewController:AddressManageVC animated:YES];

}

@end
