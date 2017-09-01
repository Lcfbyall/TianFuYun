//
//  DiscoRoadShowListController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowListController.h"
#import "DiscoRoadShowConfig.h"
#import "DiscoRoadShowConfigurator.h"

@interface DiscoRoadShowListController ()

@property (nonatomic,strong) DiscoRoadShowConfig *config;

@property (nonatomic,strong) DiscoRoadShowConfigurator *configurator;

@property (nonatomic,weak) id<DiscoRoadShowListInteractor> interactor;
@property (weak, nonatomic) IBOutlet UICollectionView *showlist;

@end

@implementation DiscoRoadShowListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    [self setupConfiguator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


#pragma mark - <Config>

- (void)setupConfig{

    _config = [[DiscoRoadShowConfig alloc]init];
    
    [_config setup:self];
}


- (void)setupConfiguator{

    _configurator = [[DiscoRoadShowConfigurator alloc]init];
    
    [_configurator setup:self];
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{


}

- (UIView *)tjs_listView{
 
    return _showlist;
}


#pragma mark - <TJSBaseCollectionViewCellDelegate>

- (BOOL)onTapCell:(id)value{

    [UIViewController tjs_pushViewController:DiscoryRoadShowDetailVC params:@{} animated:YES];
  
    return YES;
}


@end
