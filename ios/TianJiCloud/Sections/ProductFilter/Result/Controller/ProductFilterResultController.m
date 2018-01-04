//
//  ProductFilterResultController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterResultController.h"
#import "FilterResultVCConfig.h"
#import "ProductFilterResultConfigurator.h"


@interface ProductFilterResultController ()

@property (nonatomic,strong)FilterResultVCConfig *config;

@property (nonatomic,strong)ProductFilterResultConfigurator *configurator;

@property (nonatomic,strong) id<ProductFilterResultInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *resultlist;


@end

@implementation ProductFilterResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - config

- (void)setupConfig{
 
    FilterResultVCConfig *config = [[FilterResultVCConfig alloc]init];
    [config setup:self];
    
    _config = config;
}

- (void)setupConfigurator{

    ProductFilterResultConfigurator *configurator = [[ProductFilterResultConfigurator alloc]init];
    
    [configurator setup:self];
    _configurator = configurator;
    
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{
[super tjs_configBaseView];
    
}

- (UIScrollView *)tjs_listView{
 
    return _resultlist;
}

@end
