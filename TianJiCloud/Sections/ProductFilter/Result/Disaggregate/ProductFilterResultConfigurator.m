//
//  ProductFilterResultConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterResultConfigurator.h"
#import "ProductFilterResultController.h"
#import "ProductFilterResultInteractorImpl.h"
#import "ProductFilterResultDataSourceImpl.h"
#import "ProductFilterResultLayoutImpl.h"
#import "ProductFilterResultTableAdapter.h"

@interface ProductFilterResultConfigurator ()

@property (nonatomic,strong) ProductFilterResultInteractorImpl *interactorImpl;

@property (nonatomic,strong) ProductFilterResultTableAdapter *adapter;


@end

@implementation ProductFilterResultConfigurator

- (void)setup:(ProductFilterResultController *)vc{
  
    UITableView *tableView = (UITableView *)vc.tjs_listView;
    
    //1.
    ProductFilterResultDataSourceImpl *dataSource = [[ProductFilterResultDataSourceImpl alloc]init];
    
    ProductFilterResultLayoutImpl *layout = [[ProductFilterResultLayoutImpl alloc]initWithTableView:tableView];
    
    _interactorImpl = [[ProductFilterResultInteractorImpl alloc]init];
    _interactorImpl.delegate = vc;
    _interactorImpl.layout = layout;
    _interactorImpl.dataSource = dataSource;
    
    [layout setDelegate:_interactorImpl];
    
    
    //2.
    _adapter = [[ProductFilterResultTableAdapter alloc]init];
    _adapter.interactor = _interactorImpl;
//    _adapter.cellDelegate =  vc;
    
    //3.
    tableView.dataSource = _adapter;
    tableView.delegate = _adapter;
    
    
    //4.
    [vc setInteractor:_interactorImpl];
 
    
    //5.
    
    [layout beginRefresh];
    
    
}

@end
