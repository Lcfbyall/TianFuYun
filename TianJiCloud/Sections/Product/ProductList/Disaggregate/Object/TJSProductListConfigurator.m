//
//  TJSProductConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListConfigurator.h"
#import "ProductListViewController.h"
#import "TJSProductListInteractorImpl.h"
#import "TJSProductListDataSourceImpl.h"
#import "TJSProductListLayoutImpl.h"
#import "TJSProductListTableAdapter.h"


@interface TJSProductListConfigurator ()

@property (nonatomic,strong) TJSProductListInteractorImpl   *interactor;

@property (nonatomic,strong) TJSProductListTableAdapter     *tableAdapter;

@end

@implementation TJSProductListConfigurator

- (void)setup:(ProductListViewController *)vc{

    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    
    //1.
    TJSProductListDataSourceImpl *dataSourceImpl =  [[TJSProductListDataSourceImpl alloc]init];
    
    //layout 需要 tableView
    TJSProductListLayoutImpl     *layoutImpl  =  [[TJSProductListLayoutImpl alloc]initWithTableView:tableView];
    //
    _interactor = [[TJSProductListInteractorImpl alloc]init];
    
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    [layoutImpl setDelegate:_interactor];
    
    
    //2.
    _tableAdapter = [[TJSProductListTableAdapter alloc]init];
    
    _tableAdapter.interactor   = _interactor;
    _tableAdapter.cellDelegate = vc;
    
    
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
