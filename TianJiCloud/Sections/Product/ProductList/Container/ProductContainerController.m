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

@interface ProductContainerController ()

@property (nonatomic,strong) ProductListVCConfig *vcConfig;


@end

@implementation ProductContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self setProductConfig];
    
    
    self.isfullScreen = NO;
    
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    }];
    
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        
        *norColor = [UIColor darkTextColor];
        *selColor = [UIColor iOS7darkBlueColor];
        //*titleWidth = SCREEN_WIDTH/4.0;
        *titleHeight = 51.0;
    }];
    
  
    NSArray *listNameArray =
      @[
          @"最新",@"最热",@"精选",@"信托产品",
          @"资管机计划",@"债权基金",@"股权基金",@"证券基金"
      ];
    
    
    [listNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ProductListViewController *vc = LOAD_Storyboard(ProductSB, ProductListVC);
        vc.title = obj;
        
        [self addChildViewController:vc];
        
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - settings

- (void)setProductConfig{
    
    _vcConfig = [[ProductListVCConfig alloc]init];
    [_vcConfig setup:self];
    
    self.navigationItem.rightBarButtonItems = [_vcConfig tjs_rightBarButtonItems];
    
    self.navigationItem.titleView = [_vcConfig tjs_titleView];
}


#pragma mark - ProductListVCConfig

- (void)onTapRightBarBtnToProductSearch:(id)sender{
    
    [UIViewController tjs_pushViewController:ProductFilterVC
                                      params:@{}
                                    animated:YES];
}

- (void)onTapSearchBarToProductSearch:(id)sender{
    
    [UIViewController tjs_pushViewController:ProductSearchVC
                                      params:@{HideBackBarButtonItemKey:@YES}
                                 backHandler:^(id  _Nullable obj) {
         
         [((UIViewController *)obj).navigationController popViewControllerAnimated:YES];
         
     } animated:NO];
}

@end
