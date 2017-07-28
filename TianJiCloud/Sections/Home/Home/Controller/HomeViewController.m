//
//  HomeViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeViewController.h"
#import "TJSHomeListConfigurator.h"

@interface HomeViewController ()

@property (nonatomic,strong) HomeVCConfig *homeConfig;
@property (nonatomic,strong) TJSHomeListConfigurator *configurator;
@property (nonatomic,strong) id<TJSHomeListInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *productListTBView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setHomeConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - settings

- (void)setHomeConfig{
  
    HomeVCConfig *homeConfig = [[HomeVCConfig alloc]init];
    [homeConfig setup:self];
    
    self.navigationItem.leftBarButtonItems = [homeConfig tjs_leftBarButtonItems];
    
    self.navigationItem.rightBarButtonItems = [homeConfig tjs_rightBarButtonItems];
    
    self.navigationItem.titleView = [homeConfig tjs_titleView];
    
    _homeConfig = homeConfig;
}

- (void)setupConfigurator{
    
    _configurator = [[TJSHomeListConfigurator alloc]init];
    
    [_configurator setup:self];
    
}


#pragma mark - <TJSBaseVCConfig>
- (void)tjs_configBaseView{
    
    
}

- (UIView *)tjs_listView{
    
    return _productListTBView;
}



#pragma mark - <HomeVCConfig>

- (void)onTapLeftBarBtnToMessageKindList:(id)sender{

    [self tjs_pushViewController:MessageKindListVC animated:YES];
}


- (void)onTapRightBarBtnToProductFilter:(id)sender{

    [self tjs_pushViewController:ProductFilterVC animated:YES];
}


#pragma mark - <TJSProductListCellDelegate>

- (BOOL)onTapCell:(id)event{
  
    [self tjs_pushViewController:ProductDetailVC params:@{} backHandler:^(id  _Nullable obj) {
        
        [((UIViewController *)obj).navigationController popViewControllerAnimated:YES];
      
    } animated:YES];

    
    return YES;
}

@end
