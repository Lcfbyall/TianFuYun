//
//  ContractAddAddressConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressConfigurator.h"
#import "AddAdressViewController.h"

#import "ContractAddAddressInteractorImpl.h"
#import "ContractAddAddressDataSourceImpl.h"
#import "ContractAddAddressLayoutImpl.h"
#import "ContractAddAddressTableAdapter.h"


@interface ContractAddAddressConfigurator ()

@property (nonatomic,strong) ContractAddAddressInteractorImpl *interactor;

@property (nonatomic,strong) ContractAddAddressTableAdapter *tableAdapter;

@end


@implementation ContractAddAddressConfigurator

- (void)setup:(AddAdressViewController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    ContractAddAddressDataSourceImpl *dataSoureImpl = [[ContractAddAddressDataSourceImpl alloc]init];
    ContractAddAddressLayoutImpl *layoutImpl = [[ContractAddAddressLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[ContractAddAddressInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[ContractAddAddressTableAdapter alloc]initWithTableView:tableView];
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
