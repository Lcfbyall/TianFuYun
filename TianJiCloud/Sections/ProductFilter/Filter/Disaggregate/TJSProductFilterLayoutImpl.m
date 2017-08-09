//
//  TJSProductFilterLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterLayoutImpl.h"

@interface TJSProductFilterLayoutImpl ()

@property (nonatomic,strong)  UICollectionView *collectionView;

@property (nonatomic,weak) id<ProductFilterLayoutDelegate> delegate;

@end

@implementation TJSProductFilterLayoutImpl

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{
  
    self = [super init];
    if(self){
     
        _collectionView = collectionView;
        
        [self setupRefreshControl];
    }
    
    return self;
}



#pragma mark - <ProductFilterLayout>

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths{

    
}

- (void)reloadCollect{
  
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
        
        STRONG_SELF(self)
        if(self){
          
            if ([self.delegate respondsToSelector:@selector(onRefresh)])
            {
                [self.delegate onRefresh];
            }
        }
    }];
    
}

@end
