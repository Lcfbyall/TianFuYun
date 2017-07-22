//
//  ProductViewController.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductVCConfig.h"
#import "ProductListCell.h"

#import "TJSProductListConfigurator.h"

@interface ProductListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *productListTBView;

@property (nonatomic,strong)ProductVCConfig *vcConfig;

@property (nonatomic,strong)  TJSProductListConfigurator *configurator;

@property (nonatomic,weak)    id<TJSProductListInteractor> interactor;


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
    
    [self setupConfigurator];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TJSBaseVCConfig
- (void)tjs_configBaseView{



}

- (void)setupNav{
    
    _vcConfig = [[ProductVCConfig alloc]init];
    
    self.navigationItem.leftBarButtonItems = [_vcConfig tjs_leftBarButtonItems];
    
    self.navigationItem.rightBarButtonItems = [_vcConfig tjs_rightBarButtonItems];
    
    self.navigationItem.titleView = [_vcConfig tjs_titleView];
}

- (void)setupConfigurator{
 
    

}


#pragma mark - getters && setters
- (UITableView *)tableView{
  
    return _productListTBView;
}

@end
