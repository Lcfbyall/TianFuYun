//
//  MyOrderListViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderListViewController.h"
#import "MyOrderListVCConfig.h"
#import "TJSMyOrderListConfigurator.h"


@interface MyOrderListViewController ()

@property (nonatomic,strong) MyOrderListVCConfig *config;

@property (nonatomic,strong) TJSMyOrderListConfigurator *configurator;

@property (nonatomic,weak)   id<TJSMyOrderListInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *orderList;


@end

@implementation MyOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setOrderConfig];
    
    [self setupConfigurator];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - settings

- (void)setOrderConfig{
    
    MyOrderListVCConfig *config = [[MyOrderListVCConfig alloc]init];
    [config setup:self];
    
    _config = config;
}

- (void)setupConfigurator{

    _configurator = [[TJSMyOrderListConfigurator alloc]init];
    
    [_configurator setup:self];
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

    _orderList.backgroundColor = ThemeService.weak_color_10;
    _orderList.tableFooterView = [UIView new];
}

- (UIView *)tjs_listView{

    return _orderList;
}


#pragma mark - <MyOrderVCConfig>


#pragma mark - <TJSMyOrderListInteractorDelegate>


#pragma mark - <MyOrderListCellDelegate>

- (BOOL)onTapCell:(id)obj{

    return YES;
}

- (BOOL)onLongPressCell:(id)obj inView:(UIView *)view{
 
    return YES;
}

@end
