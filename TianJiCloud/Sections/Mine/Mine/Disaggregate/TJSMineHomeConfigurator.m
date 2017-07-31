//
//  TJSMineHomeConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeConfigurator.h"
#import "MineViewController.h"

#import "TJSMineHomeInteractorImpl.h"
#import "TJSMineHomeTableAdapter.h"
#import "TJSMineHomeDataSourceImpl.h"
#import "TJSMineHomeLayoutImpl.h"

@interface TJSMineHomeConfigurator ()

@property (nonatomic,strong) TJSMineHomeInteractorImpl   *interactor;

@property (nonatomic,strong) TJSMineHomeTableAdapter     *tableAdapter;


@end

@implementation TJSMineHomeConfigurator

- (void)setup:(MineViewController *)vc{

    
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    
    //1.
    TJSMineHomeDataSourceImpl *dataSourceImpl =  [[TJSMineHomeDataSourceImpl alloc]init];
    
    //layout 需要 tableView
    TJSMineHomeLayoutImpl     *layoutImpl  =  [[TJSMineHomeLayoutImpl alloc]initWithTableView:tableView];
    //
    _interactor = [[TJSMineHomeInteractorImpl alloc]init];
    
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    [layoutImpl setDelegate:_interactor];
    
    
    //2.
    _tableAdapter = [[TJSMineHomeTableAdapter alloc]init];
    
    _tableAdapter.interactor   = _interactor;
    _tableAdapter.cellDelegate = vc;
    
    
    //3.
    tableView.delegate      = _tableAdapter;
    tableView.dataSource    = _tableAdapter;
    
    
    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    //自动刷新
    //[layoutImpl beginRefresh];

}


@end
