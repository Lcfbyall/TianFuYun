//
//  AddAdressViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddAdressViewController.h"
#import "ContractAddAddressConfigurator.h"

@interface AddAdressViewController ()

@property (nonatomic,strong)ContractAddAddressConfigurator *configurator;

@property (nonatomic,strong) id<ContractAddAddressInteractor>interactor;

@property (weak, nonatomic) IBOutlet UITableView *addressEidtList;



@end

@implementation AddAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新增地址";
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



#pragma mark - setupConfigurator

- (void)setupConfigurator{

    _configurator = [[ContractAddAddressConfigurator alloc]init];
    
    [_configurator setup:self];
}


#pragma mark - <TJSBaseVCConfig>

- (UIView *)tjs_listView{
  
    return _addressEidtList;
}


@end
