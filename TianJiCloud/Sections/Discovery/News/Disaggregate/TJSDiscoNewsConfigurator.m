//
//  TJSDiscoNewsConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSDiscoNewsConfigurator.h"
#import "DiscoNewsListController.h"
#import "TJSDiscoNewsInteracotImpl.h"
#import "TJSDiscoNewsDataSorceImpl.h"
#import "TJSDiscoNewsLayoutImpl.h"
#import "TJSDiscoNewsListAdapter.h"

@interface TJSDiscoNewsConfigurator ()

@property (nonatomic,strong) TJSDiscoNewsInteracotImpl *interactor;

@property (nonatomic,strong) TJSDiscoNewsListAdapter   *tableAdapter;

@end

@implementation TJSDiscoNewsConfigurator


- (void)setup:(DiscoNewsListController *)vc{
    
    UICollectionView *collectionView = (UICollectionView *)vc.tjs_listView;
    
    //1.
    TJSDiscoNewsDataSorceImpl *dataSourceImpl =  [[TJSDiscoNewsDataSorceImpl alloc]init];
    
    //layout 需要 tableView
    TJSDiscoNewsLayoutImpl     *layoutImpl  =  [[TJSDiscoNewsLayoutImpl alloc] initWithCollectionView:collectionView];
    //
    _interactor = [[TJSDiscoNewsInteracotImpl alloc]init];
    
    _interactor.delegate       = vc;
    
    _interactor.dataSource     = dataSourceImpl;
    _interactor.layout         = layoutImpl;
    
    [layoutImpl setDelegate:_interactor];
    
    
    //2.
    _tableAdapter = [[TJSDiscoNewsListAdapter alloc]init];
    
    _tableAdapter.interactor   = _interactor;
    //_tableAdapter.cellDelegate = vc;
    
    
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
