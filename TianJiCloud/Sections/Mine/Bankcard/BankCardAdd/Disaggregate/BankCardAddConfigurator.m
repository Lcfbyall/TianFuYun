//
//  BankCardAddConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddConfigurator.h"
#import "BankCardAddViewController.h"

#import "BankCardAddInteractorImpl.h"
#import "BankCardAddDataSourceImpl.h"
#import "BankCardAddLayoutImpl.h"
#import "BankCardAddTableAdapter.h"


@interface BankCardAddConfigurator ()

@property (nonatomic,strong) BankCardAddInteractorImpl *interactor;

@property (nonatomic,strong) BankCardAddTableAdapter *tableAdapter;

@end


@implementation BankCardAddConfigurator

- (void)setup:(BankCardAddViewController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    BankCardAddDataSourceImpl *dataSoureImpl = [[BankCardAddDataSourceImpl alloc]init];
    BankCardAddLayoutImpl *layoutImpl = [[BankCardAddLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[BankCardAddInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[BankCardAddTableAdapter alloc]initWithTableView:tableView];
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
