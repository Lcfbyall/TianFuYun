//
//  AddAdressViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddAdressViewController.h"
#import "ContractAddAddressConfig.h"
#import "ContractAddAddressConfigurator.h"

@interface AddAdressViewController ()

@property (nonatomic,strong)ContractAddAddressConfig *config;

@property (nonatomic,strong)ContractAddAddressConfigurator *configurator;

@property (nonatomic,strong) id<ContractAddAddressInteractor>interactor;

@property (weak, nonatomic) IBOutlet UITableView *addressEidtList;



@end

@implementation AddAdressViewController

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
 
    _config = [[ContractAddAddressConfig alloc]init];
    
    [_config setup:self];
    
    self.navigationItem.rightBarButtonItems = [_config tjs_rightBarButtonItems];
}

#pragma mark - setupConfigurator

- (void)setupConfigurator{

    _configurator = [[ContractAddAddressConfigurator alloc]init];
    
    [_configurator setup:self];
}


#pragma mark - 

- (void)tjs_configBaseView{
 
    
    
}


#pragma mark - <TJSBaseVCConfig>

- (UIView *)tjs_listView{
  
    return _addressEidtList;
}


#pragma mark - <ContractAddAddressConfig>

- (void)onTapRightBarBtnToSaveAddress:(id)sender{

   [self.interactor saveAddress:^(id result, NSError *error) {
      
       [UIViewController tjs_popViewControllerAnimated:YES];
       
   }];
    
}

#pragma  maek - <TJSBaseTableViewCellDelegate>

- (BOOL)onTapCell:(id)value{


    return YES;
}


@end
