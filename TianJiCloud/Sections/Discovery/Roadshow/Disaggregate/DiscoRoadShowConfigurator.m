//
//  DiscoRoadShowConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowConfigurator.h"
#import "DiscoRoadShowListController.h"
#import "DiscoRoadShowInteracotImpl.h"
#import "DiscoRoadShowDataSorceImpl.h"
#import "DiscoRoadShowLayoutImpl.h"
#import "DiscoRoadShowListAdapter.h"

@interface DiscoRoadShowConfigurator ()

@property (nonatomic,strong) DiscoRoadShowInteracotImpl *interactor;

@property (nonatomic,strong) DiscoRoadShowListAdapter   *tableAdapter;

@end

@implementation DiscoRoadShowConfigurator

- (void)setup:(DiscoRoadShowListController *)vc{

    UICollectionView *collectionView = (UICollectionView *)vc.tjs_listView;
    
    //1.
    DiscoRoadShowDataSorceImpl *dataSourceImpl =  [[DiscoRoadShowDataSorceImpl alloc]init];
    
    //layout 需要 tableView
    DiscoRoadShowLayoutImpl     *layoutImpl  =  [[DiscoRoadShowLayoutImpl alloc] initWithCollectionView:collectionView];
    //
    _interactor = [[DiscoRoadShowInteracotImpl alloc]init];
    
    _interactor.delegate       = vc;
    
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    [layoutImpl setDelegate:_interactor];
    
    
    //2.
    _tableAdapter = [[DiscoRoadShowListAdapter alloc]initWithCollectionView:collectionView];
    
    _tableAdapter.interactor   = _interactor;
    _tableAdapter.cellDelegate = vc;
    
    
    //3.
    collectionView.delegate      = _tableAdapter;
    collectionView.dataSource    = _tableAdapter;
    
    
    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    //自动刷新
    [layoutImpl beginRefresh];
}

@end
