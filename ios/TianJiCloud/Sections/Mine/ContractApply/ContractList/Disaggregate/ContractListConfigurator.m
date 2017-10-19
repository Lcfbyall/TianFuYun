//
//  ContractListConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListConfigurator.h"
#import "MyContractViewController.h"

#import "ContractListInteractorImpl.h"
#import "ContractListDataSourceImpl.h"
#import "ContractListLayoutImpl.h"
#import "ContractListTableAdapter.h"


@interface ContractListConfigurator ()

@property (nonatomic,strong) ContractListInteractorImpl *interactor;

@property (nonatomic,strong) ContractListTableAdapter *tableAdapter;

@end


@implementation ContractListConfigurator

- (void)setup:(MyContractViewController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    ContractListDataSourceImpl *dataSoureImpl = [[ContractListDataSourceImpl alloc]init];
    ContractListLayoutImpl *layoutImpl = [[ContractListLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[ContractListInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[ContractListTableAdapter alloc]initWithTableView:tableView];
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
