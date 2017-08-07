//
//  TJSHomeListConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSHomeListConfigurator.h"
#import "HomeViewController.h"
#import "TJSHomeListInteractorImpl.h"
#import "TJSHomeListDataSourceImpl.h"
#import "TJSHomeListLayoutImpl.h"
#import "TJSHomeListTableAdapter.h"


@interface TJSHomeListConfigurator ()

@property (nonatomic,strong) TJSHomeListInteractorImpl   *interactor;

@property (nonatomic,strong) TJSHomeListTableAdapter     *tableAdapter;

@end


@implementation TJSHomeListConfigurator

- (void)setup:(HomeViewController *)vc{

    
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    

    TJSHomeListDataSourceImpl *dataSourceImpl =  [[TJSHomeListDataSourceImpl alloc]init];
    
    //layout 需要 tableView
    TJSHomeListLayoutImpl     *layoutImpl  =  [[TJSHomeListLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[TJSHomeListInteractorImpl alloc]init];
    
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    [layoutImpl setDelegate:_interactor];

    
    
    //2.
    _tableAdapter = [[TJSHomeListTableAdapter alloc]initWithTableView:tableView];
    _tableAdapter.interactor   = _interactor;
    _tableAdapter.cellDelegate = vc;
    
    
    //3.
    
    tableView.delegate = _tableAdapter;
    tableView.dataSource  = _tableAdapter;
    
    
    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    
    //自动刷新
    [layoutImpl beginRefresh];

}





@end
