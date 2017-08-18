//
//  BankCardListConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardListConfigurator.h"
#import "BackCardManagerController.h"

#import "BankCardListInteractorImpl.h"
#import "BankCardListDataSourceImpl.h"
#import "BankCardListLayoutImpl.h"
#import "BankCardListTableAdapter.h"


@interface BankCardListConfigurator ()

@property (nonatomic,strong) BankCardListInteractorImpl *interactor;

@property (nonatomic,strong) BankCardListTableAdapter *tableAdapter;

@end


@implementation BankCardListConfigurator

- (void)setup:(BackCardManagerController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    BankCardListDataSourceImpl *dataSoureImpl = [[BankCardListDataSourceImpl alloc]init];
    BankCardListLayoutImpl *layoutImpl = [[BankCardListLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[BankCardListInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[BankCardListTableAdapter alloc]initWithTableView:tableView];
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
