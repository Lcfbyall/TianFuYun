//
//  TJSProductFilterConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterConfigurator.h"
#import "ProductFilterController.h"

#import "TJSProductFilterInteractorImpl.h"
#import "TJSProductFilterDataSourceImpl.h"
#import "TJSProductFilterLayoutImpl.h"
#import "TJSProductFilterCollAdapter.h"

@interface TJSProductFilterConfigurator ()

@property (nonatomic,strong) TJSProductFilterInteractorImpl *interactor;

@property (nonatomic,strong) TJSProductFilterCollAdapter *collectAdapter;

@end

@implementation TJSProductFilterConfigurator

- (void)setup:(ProductFilterController *)vc{

    UICollectionView *collectionView = (UICollectionView *)vc.tjs_listView;
    
    //1.
    TJSProductFilterDataSourceImpl *dataSourceImpl =  [[TJSProductFilterDataSourceImpl alloc]init];
    
    //layout 需要 tableView
    TJSProductFilterLayoutImpl *layoutImpl  =  [[TJSProductFilterLayoutImpl alloc]initWithCollectionView:collectionView];
    
    _interactor = [[TJSProductFilterInteractorImpl alloc]init];
    
    
    _interactor.delegate       = vc;
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    [layoutImpl setDelegate:_interactor];

    
    
    //2.
    _collectAdapter = [[TJSProductFilterCollAdapter alloc]initWithCollectionView:collectionView];
    
    
    _collectAdapter.interactor   = _interactor;
    _collectAdapter.cellDelegate = vc;
    
    
    //3.
    
    collectionView.delegate = _collectAdapter;
    collectionView.dataSource = _collectAdapter;
    
    
    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    
    //自动刷新
    [layoutImpl beginRefresh];
}



@end
