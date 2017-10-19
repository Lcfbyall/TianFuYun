//
//  WithDrawDepositConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositConfigurator.h"
#import "WithDrawDepositController.h"

#import "WithDrawDepositInteractorImpl.h"
#import "WithDrawDepositDataSourceImpl.h"
#import "WithDrawDepositLayoutImpl.h"
#import "WithDrawDepositTableAdapter.h"


@interface WithDrawDepositConfigurator ()

@property (nonatomic,strong) WithDrawDepositInteractorImpl *interactor;

@property (nonatomic,strong) WithDrawDepositTableAdapter *tableAdapter;

@end


@implementation WithDrawDepositConfigurator

- (void)setup:(WithDrawDepositController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    WithDrawDepositDataSourceImpl *dataSoureImpl = [[WithDrawDepositDataSourceImpl alloc]init];
    WithDrawDepositLayoutImpl *layoutImpl = [[WithDrawDepositLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[WithDrawDepositInteractorImpl alloc]init];
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSoureImpl;
    _interactor.layout         = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[WithDrawDepositTableAdapter alloc]initWithTableView:tableView];
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
