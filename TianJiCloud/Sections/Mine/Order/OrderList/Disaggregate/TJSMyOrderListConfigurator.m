//
//  TJSMyOrderListConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListConfigurator.h"

#import "MyOrderListViewController.h"
#import "TJSMyOrderListInteractorImpl.h"
#import "TJSMyOrderListDataSourceImpl.h"
#import "TJSMyOrderListLayoutImpl.h"
#import "TJSMyOrderListTableAdapter.h"


@interface TJSMyOrderListConfigurator ()

@property (nonatomic,strong) TJSMyOrderListInteractorImpl   *interactor;

@property (nonatomic,strong) TJSMyOrderListTableAdapter     *tableAdapter;

@end

@implementation TJSMyOrderListConfigurator

- (void)setup:(MyOrderListViewController *)vc{

    
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    
    //1.
    TJSMyOrderListDataSourceImpl *dataSourceImpl =  [[TJSMyOrderListDataSourceImpl alloc]init];
    
    //layout 需要 tableView
    TJSMyOrderListLayoutImpl     *layoutImpl  =  [[TJSMyOrderListLayoutImpl alloc]initWithTableView:tableView];
    //
    _interactor = [[TJSMyOrderListInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    
    [layoutImpl setDelegate:_interactor];
    
    
    //2.
    _tableAdapter = [[TJSMyOrderListTableAdapter alloc]initWithTableView:tableView];
    
    
    _tableAdapter.interactor   = _interactor;
    //_tableAdapter.cellDelegate = vc;
    
    
    //3.
    tableView.delegate      = _tableAdapter;
    tableView.dataSource    = _tableAdapter;
    
    
    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    
    //自动刷新
    [layoutImpl beginRefresh];

}



@end
