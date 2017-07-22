//
//  TJSProductConfigurator.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListConfigurator.h"

#import "TJSProductListInteractorImpl.h"

#import "TJSProductListDataSourceImpl.h"
#import "TJSProductListLayoutImpl.h"
#import "TJSProductListTableAdapter.h"


@interface TJSProductListConfigurator ()

@property (nonatomic,strong) TJSProductListInteractorImpl   *interactor;

@property (nonatomic,strong) TJSProductListTableAdapter     *tableAdapter;

@end

@implementation TJSProductListConfigurator

- (void)setup:(ProductListViewController *)vc{

    //UITableView *tableView = vc.tableView;
    
    
    //1.
    TJSProductListDataSourceImpl *dataSourceImpl =  [[TJSProductListDataSourceImpl alloc]init];
    
    //layout 需要 tableView
    TJSProductListLayoutImpl     *layoutImpl  =  [[TJSProductListLayoutImpl alloc]init];
    //
    _interactor = [[TJSProductListInteractorImpl alloc]init];
    
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    
    
    //2.
    _tableAdapter = [[TJSProductListTableAdapter alloc]init];
    
    _tableAdapter.interactor   = _interactor;
    _tableAdapter.cellDelegate = vc;
    
    
    //3.
    vc.tableView.delegate      = _tableAdapter;
    vc.tableView.dataSource    = _tableAdapter;
    
    [vc setInteractor:_interactor];

}


@end
