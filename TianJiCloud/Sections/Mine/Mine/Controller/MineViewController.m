//
//  MineViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineViewController.h"

#import "MineHomeVCConfig.h"
#import "TJSMineHomeConfigurator.h"

@interface MineViewController ()

@property (nonatomic,strong) MineHomeVCConfig *minehomeConfig;
@property (nonatomic,strong) TJSMineHomeConfigurator *configurator;
@property (nonatomic,strong) id<TJSMineHomeInteractor> interactor;

@property (weak, nonatomic) IBOutlet UITableView *mineTableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setHomeConfig];
    
    [self setupConfigurator];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - settings

- (void)setHomeConfig{

    MineHomeVCConfig *minehomeConfig = [[MineHomeVCConfig alloc]init];
    
    [minehomeConfig setup:self];
    
    self.navigationItem.leftBarButtonItems = [minehomeConfig tjs_leftBarButtonItems];
    
    self.navigationItem.rightBarButtonItems = [minehomeConfig tjs_rightBarButtonItems];
    
    _minehomeConfig = minehomeConfig;
}

- (void)setupConfigurator{

    _configurator = [[TJSMineHomeConfigurator alloc]init];
    
    [_configurator setup:self];
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{
    
    
    
}

- (UIView *)tjs_listView{
    
    return _mineTableView;
}



#pragma mark - <MineHomeVCConfig>

- (void)onTapLeftBarBtnToSettingList:(id)sender{
   
    [UIViewController tjs_pushViewController:SettingListVC
                                      params:@{}
                                    animated:YES];
}

- (void)onTapRightBarBtnToHideOrShowSum:(id)sender{
  
    [self.interactor hideOrShowMoney:((UIButton *)sender).selected];
   
}

@end
