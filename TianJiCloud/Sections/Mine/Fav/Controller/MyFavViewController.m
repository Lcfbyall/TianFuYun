//
//  MyFavViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavViewController.h"

#import "MyFavVCConfig.h"
#import "MyFavListConfigurator.h"

@interface MyFavViewController ()

@property (nonatomic,strong)MyFavVCConfig *config;

@property (nonatomic,strong)MyFavListConfigurator *configurtor;

@property (nonatomic,strong) id <MyFavListInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *favlist;


@end

@implementation MyFavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的收藏";
    
    [self setupFavConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


#pragma mark - settings

- (void)setupFavConfig{

 
    
}

- (void)setupConfigurator{

    _configurtor = [[MyFavListConfigurator alloc]init];
    
    [_configurtor setup:self];
}


#pragma mark - <MyFavListCellDelegate>

- (BOOL)onTapCell:(id)event{
    
    [UIViewController tjs_pushViewController:ProductDetailVC
                                      params:@{}
                                    animated:YES];
    
    
    return YES;
}



#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

    

}

- (UIView *)tjs_listView{
  
    return _favlist;
}

@end
