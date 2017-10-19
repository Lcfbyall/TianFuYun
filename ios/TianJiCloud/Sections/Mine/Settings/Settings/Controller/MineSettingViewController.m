//
//  MineSettingViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineSettingViewController.h"
#import "SettingHomeConfig.h"
#import "SettingHomeConfigurator.h"


@interface MineSettingViewController ()

@property (nonatomic,strong)SettingHomeConfig *config;

@property (nonatomic,strong)SettingHomeConfigurator *configurator;

@property (nonatomic,strong) id <SettingHomeInteractor>  interactor;


@property (weak, nonatomic) IBOutlet UITableView *settingTableView;

@end

@implementation MineSettingViewController

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


#pragma mark - setupConfig

- (void)setupConfig{
    
    _config = [[SettingHomeConfig alloc]init];
    [_config setup:self];
    
}


#pragma mark - setupConfigurator

- (void)setupConfigurator{
    
    _configurator = [[SettingHomeConfigurator alloc]init];
    
    [_configurator setup:self];
    
}


#pragma mark - <TJSBaseVCConfig>

- (UIScrollView *)tjs_listView{
    
    return _settingTableView;
}



@end
