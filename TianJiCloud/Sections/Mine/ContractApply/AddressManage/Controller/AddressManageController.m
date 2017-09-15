//
//  AddressManageController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageController.h"
#import "AddressManageConfig.h"
#import "AddressManageConfigurator.h"

@interface AddressManageController ()

@property (nonatomic,strong)AddressManageConfig *config;

@property (nonatomic,strong) AddressManageConfigurator *configurator;

@property (nonatomic,strong) id <AddressManageInteractor>  interactor;

@property (weak, nonatomic) IBOutlet UITableView *addresslist;


@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end



@implementation AddressManageController

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
 
    _config = [[AddressManageConfig alloc]init];
    [_config applyButtonConfig:self.addBtn];
    [_config setup:self];

}

#pragma mark -

- (void)setupConfigurator{
 
    _configurator =  [[AddressManageConfigurator alloc]init];
    
    [_configurator setup:self];

}


#pragma mark - <TJSBaseTableViewCellDelegate>

- (BOOL)onTapCell:(id)value{

    return YES;
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{
    
    [self.addBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        [UIViewController tjs_pushViewController:ContractApplyVC animated:YES];
        
    }];
}
- (UIScrollView *)tjs_listView{

    return _addresslist;
}

@end
