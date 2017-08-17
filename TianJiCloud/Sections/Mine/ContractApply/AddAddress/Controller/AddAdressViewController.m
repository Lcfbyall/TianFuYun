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

@property (nonatomic,strong) id<ContractAddAddressInteractor>interactor;

@property (weak, nonatomic) IBOutlet UITableView *addressEidtList;



@end

@implementation AddAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新增地址";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



- (UIView *)tjs_listView{
  
    return _addressEidtList;
}


@end
