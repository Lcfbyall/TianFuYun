//
//  DiscoRoadShowLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowLayoutImpl.h"


@interface DiscoRoadShowLayoutImpl ()

@property (nonatomic,strong)  UICollectionView *collectionView;

@property (nonatomic,weak)    id<DiscoRoadShowLayoutDelegate> delegate;

@end

@implementation DiscoRoadShowLayoutImpl

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{
    
    self = [super init];
    if(self){
        
        _collectionView = collectionView;
        
        
        [self setupRefreshControl];
    }
    
    return self;
}

- (void)dealloc{
    
    
}



#pragma mark - <DiscoRoadShowLayout>

- (void)reloadTable{
    
    [self.collectionView reloadData];
}

- (void)beginRefresh{
    
    [self.collectionView.mj_header beginRefreshing];
}

- (void)endRefresh{
    
    [self.collectionView.mj_header endRefreshing];
}



#pragma mark - private

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
