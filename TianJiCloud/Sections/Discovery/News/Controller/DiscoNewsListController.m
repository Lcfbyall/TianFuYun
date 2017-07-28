//
//  DiscoNewsListController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoNewsListController.h"

#import "DiscoveryNewsLayout.h"
#import "DiscoveryNewsListCell.h"

#import "TJSDiscoNewsConfigurator.h"
#import "TJSDiscoNewsInteracotImpl.h"

@interface DiscoNewsListController ()<DiscoveryNewsLayout>

@property (nonatomic,strong) TJSDiscoNewsConfigurator *configurator;

@property (nonatomic,weak)   id<TJSDiscoveryNewsListInteractor> interactor;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;


@end

@implementation DiscoNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

#pragma mark - settings

- (void)setVCConfig{
   
}

- (void)setupConfigurator{
    
    _configurator = [[TJSDiscoNewsConfigurator alloc]init];
    
    [_configurator setup:self];
    
}




#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{
    
    
    
}

- (UIView *)tjs_listView{
    
    return _newsCollectionView;
}




@end
