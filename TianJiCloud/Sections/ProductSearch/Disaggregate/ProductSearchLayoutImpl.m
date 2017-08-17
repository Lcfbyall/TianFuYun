//
//  ProductSearchLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchLayoutImpl.h"

@interface ProductSearchLayoutImpl ()

@property (nonatomic,weak) id<ProductSearchLayoutDelegate> delegate;

@property (nonatomic,weak) UICollectionView *collectionView;

@end

@implementation ProductSearchLayoutImpl

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{

    self = [super init];

    if(self){
 
        _collectionView = collectionView;


        [self setupRefreshControl];

    }
    
    return self;
}


#pragma mark - <ProductSearchLayout>

- (void)reloadCollect{

    [self.collectionView reloadData];
}

- (void)beginRefresh{
  
    [self.collectionView.mj_header beginRefreshing];
}

- (void)endRefresh{

    [self.collectionView.mj_header endRefreshing];
}


#pragma mark - Private

- (void)setupRefreshControl{

    
    WEAK_SELF(self);
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        STRONG_SELF(self);
        
        if(self){
            
            if ([self.delegate respondsToSelector:@selector(onRefresh)])
            {
                [self.delegate onRefresh];
            }
            
        }
        
    }];
}


@end