//
//  TJSProductDetailController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductDetailController.h"
#import "ProductDetailConfig.h"

@interface TJSProductDetailController ()

@property (nonatomic,strong)ProductDetailConfig *config;



@end

@implementation TJSProductDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - config

- (void)setupConfig{
  
    _config = [[ProductDetailConfig alloc]init];
    
    [_config setup:self];
}

- (void)setupConfigurator{
  
    
}

#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

  
}

- (UIView *)tjs_listView{
  
    return self.tjs_wkWebView;

}


@end
