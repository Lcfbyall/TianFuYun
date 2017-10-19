//
//  ContractApplyConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyConfigurator.h"
#import "ContractApplyController.h"

#import "ContractApplyInteractorImpl.h"
#import "ContractApplyDataSourceImpl.h"
#import "ContractApplyLayoutImpl.h"
#import "ContractApplyTableAdapter.h"


@interface ContractApplyConfigurator ()

@property (nonatomic,strong) ContractApplyInteractorImpl *interactor;

@property (nonatomic,strong) ContractApplyTableAdapter *tableAdapter;

@end


@implementation ContractApplyConfigurator

- (void)setup:(ContractApplyController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    ContractApplyDataSourceImpl *dataSoureImpl = [[ContractApplyDataSourceImpl alloc]init];
    ContractApplyLayoutImpl *layoutImpl = [[ContractApplyLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[ContractApplyInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[ContractApplyTableAdapter alloc]initWithTableView:tableView];
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
