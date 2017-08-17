//
//  AddressSelectController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectController.h"

#import "AddressSelectedConfigurator.h"

@interface AddressSelectController ()

@property (nonatomic,strong)AddressSelectedConfigurator *configurator;

@property (nonatomic,strong) id <AddressSelectedInteractor>  interactor;


@property (weak, nonatomic) IBOutlet UITableView *addreslist;

@end

@implementation AddressSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"选择地址";
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupConfigurator{
 
    _configurator = [[AddressSelectedConfigurator alloc]init];

    [_configurator setup:self];
}


- (UIView *)tjs_listView{
  
    return _addreslist;
}

@end
