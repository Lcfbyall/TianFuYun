//
//  HomeViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeViewController.h"
#import "MessageKindListController.h"
#import "HomeVCConfig.h"
#import "TJSHomeListConfigurator.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>


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
    
    _productListTBView.backgroundColor = ThemeService.weak_color_00;
    _productListTBView.tableFooterView = [UIView new];
    
}

- (UIScrollView *)tjs_listView{
    
    return _productListTBView;
}



#pragma mark - <HomeVCConfig>

- (void)onTapLeftBarBtnToMessageKindList:(id)sender{

    NSLog(@"High Score Button Pressed");
    
    /*
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
     */
    
    NSURL *jsCodeLocation;
    
    
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"TianJiCloud"
                         initialProperties :
                                     @{
                                       @"scores" : @[
                                                       @{
                                                           @"name" : @"Alex",
                                                           @"value": @"42"
                                                        },
                                                       @{
                                                           @"name" : @"Joel",
                                                           @"value": @"10"
                                                        }
                                                   ]
                                       }
     
                          launchOptions: nil];
    
    
    MessageKindListController *vc = (MessageKindListController *)[[UIStoryboard storyboardWithName:MainSB bundle:nil] instantiateViewControllerWithIdentifier:MessageKindListVC];
    vc.view = rootView;
    [self.navigationController pushViewController:vc animated:YES];
    
    
   // [UIViewController tjs_pushViewController:MessageKindListVC params:@{@"rootView":rootView}  animated:YES];
}

- (void)onTapRightBarBtnToProductFilter:(id)sender{

    [UIViewController tjs_pushViewController:ProductFilterVC animated:YES];
}

- (void)onTapSearchBarToProductSearch:(id)sender{
    
    [UIViewController tjs_pushViewController:ProductSearchVC
                          params:[UINavigationBar basicStyleWhiteWithHideBack]
                     backHandler:^(id  _Nullable obj) {
                         
         [((UIViewController *)obj).navigationController popViewControllerAnimated:YES];
         
     } animated:NO];
}


#pragma mark - <TJSProductListCellDelegate>

- (BOOL)onTapCell:(id)event{
  
    [UIViewController tjs_pushViewController:ProductDetailVC params:@{@"webUrl":@"http://wandou.im/1ig5qp"} animated:YES];
    return YES;
}

@end
