//
//  SettingHomeConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeConfigurator.h"
#import "MineSettingViewController.h"

#import "SettingHomeInteractorImpl.h"
#import "SettingHomeDataSourceImpl.h"
#import "SettingHomeLayoutImpl.h"
#import "SettingHomeTableAdapter.h"


@interface SettingHomeConfigurator ()

@property (nonatomic,strong) SettingHomeInteractorImpl *interactor;

@property (nonatomic,strong) SettingHomeTableAdapter *tableAdapter;

@end


@implementation SettingHomeConfigurator

- (void)setup:(MineSettingViewController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    SettingHomeDataSourceImpl *dataSoureImpl = [[SettingHomeDataSourceImpl alloc]init];
    SettingHomeLayoutImpl *layoutImpl = [[SettingHomeLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[SettingHomeInteractorImpl alloc]init];
    _interactor.delegate  = vc;
    _interactor.dataSource = dataSoureImpl;
    _interactor.layout  = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[SettingHomeTableAdapter alloc]initWithTableView:tableView];
    _tableAdapter.interactor   = _interactor;
    _tableAdapter.cellDelegate = vc;
    
    
    //3.
    tableView.dataSource = _tableAdapter;
    tableView.delegate   = _tableAdapter;
    
    
    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    [layoutImpl beginRefresh];
}

@end
