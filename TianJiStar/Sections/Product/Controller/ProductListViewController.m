//
//  ProductViewController.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductListVCConfig.h"
#import "ProductListCell.h"

#import "TJSProductListConfigurator.h"

@interface ProductListViewController ()

@property (weak, nonatomic)  IBOutlet UITableView *productListTBView;

@property (nonatomic,strong) ProductListVCConfig *vcConfig;

@property (nonatomic,strong) TJSProductListConfigurator *configurator;

@property (nonatomic,weak)   id<TJSProductListInteractor> interactor;


@end

@implementation ProductListViewController

- (void)dealloc
{


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self vcConfig];
    
    [self setupNav];
    
    //逻辑配置器安装，在这里把tableView的代理分离出去
    [self setupConfigurator];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TJSBaseVCConfig
- (void)tjs_configBaseView{



}

- (UITableView *)tjs_tableView{
    
    return _productListTBView;
}


#pragma mark - settings

- (void)setupNav{
    
    _vcConfig = [[ProductListVCConfig alloc]init];
    [_vcConfig setup:self];
    
    self.navigationItem.leftBarButtonItems = [_vcConfig tjs_leftBarButtonItems];
    
    self.navigationItem.rightBarButtonItems = [_vcConfig tjs_rightBarButtonItems];
    
    self.navigationItem.titleView = [_vcConfig tjs_titleView];
}

- (void)setupConfigurator{
 
    _configurator = [[TJSProductListConfigurator alloc]init];
    
    [_configurator setup:self];

}



#pragma mark - TJSProductListCellDelegate

- (BOOL)onTapCell:(TJSProductEvent *)event{

    return YES;
}

- (BOOL)onLongPressCell:(id)message inView:(UIView *)view{

    return YES;
}


#pragma mark - navigaiton actions

- (void)onTapLeftBarBtnToProductMessage:(id)sender{


}

- (void)onTapRightBarBtnToProductSearch:(id)sender{


}



@end
