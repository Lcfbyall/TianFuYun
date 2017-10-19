//
//  ProductContainerController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/2.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductContainerController.h"
#import "ProductListViewController.h"
#import "ProductListVCConfig.h"

#import "HomeHeaderConfig.h"
#import "HomeProductClickItem.h"

@interface ProductContainerController ()

@property (nonatomic,strong) ProductListVCConfig *vcConfig;



@end

@implementation ProductContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self setProductConfig];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - settings

- (void)setProductConfig{
    
    _vcConfig = [[ProductListVCConfig alloc]init];
    [_vcConfig setup:self];
    
    self.navigationItem.leftBarButtonItems = [_vcConfig tjs_leftBarButtonItems];
    
    self.navigationItem.rightBarButtonItems = [_vcConfig tjs_rightBarButtonItems];
    
    self.navigationItem.titleView = [_vcConfig tjs_titleView];
}


#pragma mark - <TJSBaseDisplayContainerProtocol>

- (void)tjs_setupChildViewControllers{

    self.isfullScreen = NO;
    
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    }];
    
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        
        *norColor = ThemeService.text_color_01;
        *selColor = ThemeService.main_color_02;
        //*titleWidth = SCREEN_WIDTH/4.0;
        *titleHeight = 51.0;
    }];
    
    
    NSArray *listNameArray = [HomeHeaderConfig productItems];
    
    [listNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ProductListViewController *vc = LOAD_Storyboard(ProductSB, ProductListVC);
        
        HomeProductClickItem *item = (HomeProductClickItem *)obj;
        
        vc.title = item.title;
        
        [self addChildViewController:vc];
        
    }];
}


#pragma mark - ProductListVCConfig

- (void)onTapRightBarBtnToProductSearch:(id)sender{
    
    [UIViewController tjs_pushViewController:ProductFilterVC
                                      params:@{}
                                    animated:YES];
}

- (void)onTapSearchBarToProductSearch:(id)sender{

   
    [UIViewController tjs_pushViewController:ProductSearchVC
                          params:[UINavigationBar basicStyleWhiteWithHideBack]
                                 backHandler:^(id  _Nullable obj) {
         
         [((UIViewController *)obj).navigationController popViewControllerAnimated:YES];
         
     } animated:NO];
}

@end
