//
//  ProductSearchController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchController.h"
#import "ProductSearchVCConfig.h"

@interface ProductSearchController ()

@property (nonatomic,strong) ProductSearchVCConfig *searchConfig;

@end

@implementation ProductSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setSearchConfig];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [_searchConfig viewDidAppear];
}


#pragma mark - settings

- (void)setSearchConfig{
    
    ProductSearchVCConfig *searchConfig = [[ProductSearchVCConfig alloc]init];
    [searchConfig setup:self];

    self.navigationItem.rightBarButtonItems = [searchConfig tjs_rightBarButtonItems];
    
    self.navigationItem.titleView = [searchConfig tjs_titleView];

    
    _searchConfig = searchConfig;
}


#pragma mark - <ProductSearchVCConfig>


@end
