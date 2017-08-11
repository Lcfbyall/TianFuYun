//
//  ProductSearchConfigurator.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchConfigurator.h"
#import "ProductSearchController.h"

#import "ProductSearchInteractorImpl.h"
#import "ProductSearchDataSourceImpl.h"
#import "ProductSearchLayoutImpl.h"
#import "ProductSearchTableAdapter.h"

@interface ProductSearchConfigurator ()

@property (nonatomic,strong) ProductSearchInteractorImpl *interactor;

@property (nonatomic,strong) ProductSearchTableAdapter *adapter;

@end

@implementation ProductSearchConfigurator


- (void)setup:(ProductSearchController *)vc{

    UICollectionView *collectionView = (UICollectionView *)vc.tjs_listView;

    
    //1.
    
    ProductSearchDataSourceImpl *dataSource = [[ProductSearchDataSourceImpl alloc]init];
    
    ProductSearchLayoutImpl *layout = [[ProductSearchLayoutImpl alloc]initWithCollectionView:collectionView];
    
    _interactor = [[ProductSearchInteractorImpl alloc]init];
    _interactor.delegate = vc;
    _interactor.dataSource = dataSource;
    _interactor.layout = layout;
    
    [layout setDelegate:_interactor];
    
    
    //2.
    _adapter = [[ProductSearchTableAdapter alloc]initWithCollectionView:collectionView];
    
    _adapter.interactor = _interactor;
//    _adapter.cellDelegate = vc;
    
    
    //3.
    collectionView.dataSource = _adapter;
    collectionView.delegate = _adapter;
    

    //4.
    [vc setInteractor:_interactor];
    
    
    //5.
    [layout beginRefresh];
    
}

@end
