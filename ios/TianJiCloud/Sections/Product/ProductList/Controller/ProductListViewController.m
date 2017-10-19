//
//  ProductViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListViewController.h"

#import "TJSProductListConfigurator.h"

@interface ProductListViewController ()

@property (weak, nonatomic)  IBOutlet UITableView *productListTBView;

@property (nonatomic,strong) TJSProductListConfigurator *configurator;

@property (nonatomic,weak) id<TJSProductListInteractor> interactor;


@end

@implementation ProductListViewController

- (void)dealloc
{


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //逻辑配置器安装，在这里把tableView的代理分离出去
    [self setupConfigurator];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

    _productListTBView.backgroundColor = ThemeService.weak_color_00;
    _productListTBView.tableFooterView = [UIView new];
}

- (UIScrollView *)tjs_listView{
    
    return _productListTBView;
}


#pragma mark - settings

- (void)setupConfigurator{
 
    _configurator = [[TJSProductListConfigurator alloc]init];
    
    [_configurator setup:self];
}



#pragma mark - <TJSProductListCellDelegate>

- (BOOL)onTapCell:(id)event{
    
    [UIViewController tjs_pushViewController:ProductDetailVC params:@{@"webUrl":@"http://wandou.im/1ig5qp"} animated:YES];
    
    return YES;
}

- (BOOL)onLongPressCell:(id)message inView:(UIView *)view{

    return YES;
}


@end
