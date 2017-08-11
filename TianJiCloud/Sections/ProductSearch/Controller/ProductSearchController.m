//
//  ProductSearchController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchController.h"
#import "ProductSearchVCConfig.h"
#import "ProductSearchConfigurator.h"


@interface ProductSearchController ()

@property (nonatomic,strong) ProductSearchVCConfig *searchConfig;

@property (nonatomic,strong) ProductSearchConfigurator *configurator;

@property (nonatomic,strong) id<ProductSerachInteractor> interactor;

@property (weak, nonatomic) IBOutlet UICollectionView *searchlist;


@end

@implementation ProductSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setSearchConfig];

    [self setupconfigurator];
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

- (void)setupconfigurator{

    ProductSearchConfigurator *configurator = [[ProductSearchConfigurator alloc]init];

    [configurator setup:self];
    _configurator = configurator;
}



#pragma mark - <ProductSearchVCConfig>

- (void)searchBarTextDidChange:(UISearchBar *)searchBar searchText:(NSString *)searchText{

    //交给self.interactor去做
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{


}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{


}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{


}


- (UIView *)tjs_listView{

    return  _searchlist;

}



@end
