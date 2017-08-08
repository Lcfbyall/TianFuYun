//
//  MyFavListConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavListConfigurator.h"
#import "MyFavViewController.h"

#import "MyFavListInteractorImpl.h"
#import "MyFavListDataSourceImpl.h"
#import "MyFavListLayoutImpl.h"
#import "MyFavListTableAdapter.h"


@interface MyFavListConfigurator ()

@property (nonatomic,strong) MyFavListInteractorImpl *interactor;

@property (nonatomic,strong) MyFavListTableAdapter *tableAdapter;

@end


@implementation MyFavListConfigurator


- (void)setup:(MyFavViewController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    MyFavListDataSourceImpl *dataSoureImpl = [[MyFavListDataSourceImpl alloc]init];
    
    MyFavListLayoutImpl *layoutImpl = [[MyFavListLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[MyFavListInteractorImpl alloc]init];
    
    //_interactor.delegate       = vc;
    //_interactor.dataSource     = dataSourceImpl;
    //_interactor.layout         = layoutImpl;
    
    //[layoutImpl setDelegate:_interactor];
    
    //2.
    
    _tableAdapter = [[MyFavListTableAdapter alloc]initWithTableView:tableView];
    //_tableAdapter.interactor   = _interactor;
    //_tableAdapter.cellDelegate = vc;
    
    
    //3.
    
    tableView.dataSource = _tableAdapter;
    tableView.delegate   = _tableAdapter;
    
    
    //4.
    
    //[vc setInterator:_interactor];
    
    
    //5.
    
    //[layoutImpl beginRefresh];
    
    
}



@end
