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



}

@end
