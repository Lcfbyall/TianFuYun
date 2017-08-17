//
//  AddressManageController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageController.h"
#import "AddressManageConfigurator.h"

@interface AddressManageController ()

@property (nonatomic,strong) AddressManageConfigurator *configurator;

@property (nonatomic,strong) id <AddressManageInteractor>  interactor;

@property (weak, nonatomic) IBOutlet UITableView *addresslist;


@end



@implementation AddressManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
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

- (UIView *)tjs_listView{

    return _addresslist;
}

@end
