//
//  CumulativeInvestConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestConfigurator.h"
#import "CumulativeInvestController.h"

#import "CumulativeInvestInteractorImpl.h"
#import "CumulativeInvestDataSourceImpl.h"
#import "CumulativeInvestLayoutImpl.h"
#import "CumulativeInvestTableAdapter.h"


@interface CumulativeInvestConfigurator ()

@property (nonatomic,strong) CumulativeInvestInteractorImpl *interactor;

@property (nonatomic,strong) CumulativeInvestTableAdapter *tableAdapter;

@end


@implementation CumulativeInvestConfigurator

- (void)setup:(CumulativeInvestController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    
    CumulativeInvestDataSourceImpl *dataSoureImpl = [[CumulativeInvestDataSourceImpl alloc]init];
    CumulativeInvestLayoutImpl *layoutImpl = [[CumulativeInvestLayoutImpl alloc]initWithTableView:tableView];
    
    _interactor = [[CumulativeInvestInteractorImpl alloc]init];
    _interactor.delegate  = vc;
    _interactor.dataSource = dataSoureImpl;
    _interactor.layout  = layoutImpl;
    [layoutImpl setDelegate:_interactor];
    
    
    
    //2.
    _tableAdapter = [[CumulativeInvestTableAdapter alloc]initWithTableView:tableView];
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
