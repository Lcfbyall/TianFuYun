//
//  AddressManageConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageConfigurator.h"
#import "AddressManageController.h"

#import "AddressManageInteractorImpl.h"
#import "AddressManageDataSourceImpl.h"
#import "AddressManageLayoutImpl.h"
#import "AddressManageTableAdapter.h"


@interface AddressManageConfigurator ()

@property (nonatomic,strong) AddressManageInteractorImpl *interactor;

@property (nonatomic,strong) AddressManageTableAdapter *tableAdapter;

@end


@implementation AddressManageConfigurator

- (void)setup:(AddressManageController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    AddressManageDataSourceImpl *dataSoureImpl = [[AddressManageDataSourceImpl alloc]init];
    AddressManageLayoutImpl *layoutImpl = [[AddressManageLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[AddressManageInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[AddressManageTableAdapter alloc]initWithTableView:tableView];
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
