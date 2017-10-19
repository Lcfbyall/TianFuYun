//
//  AddressSelectedConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectedConfigurator.h"
#import "AddressSelectController.h"

#import "AddressSelectedInteractorImpl.h"
#import "AddressSelectedDataSourceImpl.h"
#import "AddressSelectedLayoutImpl.h"
#import "AddressSelectedTableAdapter.h"


@interface AddressSelectedConfigurator ()

@property (nonatomic,strong) AddressSelectedInteractorImpl *interactor;

@property (nonatomic,strong) AddressSelectedTableAdapter *tableAdapter;

@end


@implementation AddressSelectedConfigurator

- (void)setup:(AddressSelectController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    AddressSelectedDataSourceImpl *dataSoureImpl = [[AddressSelectedDataSourceImpl alloc]init];
    AddressSelectedLayoutImpl *layoutImpl = [[AddressSelectedLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[AddressSelectedInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[AddressSelectedTableAdapter alloc]initWithTableView:tableView];
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
