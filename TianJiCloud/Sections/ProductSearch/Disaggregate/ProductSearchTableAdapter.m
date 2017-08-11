//
//  ProductSearchTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchTableAdapter.h"
#import "ProductSearchHotCell.h"
#import "ProductSearchResultCell.h"

#import "ProductSearchHotLayout.h"
#import "ProductSearchResultLayout.h"


static NSString *searchHotCellIdentifier = @"ProductSearchHotCell";
static NSString *searchResultIdentifier = @"ProductSearchResultCell";

@interface ProductSearchTableAdapter ()<ProductSearchHotLayoutDelegate,ProductSearchResultLayoutDelegate>

@property (nonatomic,weak) UICollectionView *collectionView;

@end


@implementation ProductSearchTableAdapter


- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{

    self = [super init];

    if(self){

        _collectionView = collectionView;
        
        
    }

    return self;
}

- (void)registerElementForCollecitonView{
  
    [_collectionView registerClass:[ProductSearchHotCell class] forCellWithReuseIdentifier:searchHotCellIdentifier];
    [_collectionView registerClass:[ProductSearchResultCell class] forCellWithReuseIdentifier:searchResultIdentifier];
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    return [collectionView dequeueReusableCellWithReuseIdentifier:searchHotCellIdentifier forIndexPath:indexPath];

}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
 
    
    
}


#pragma  mark - <UICollectionViewDataSourcePrefetching>




#pragma mark - <ProductSearchHotLayoutDeleate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  hotLayout:(ProductSearchHotLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

  
    return CGSizeMake(100, 40);
}



#pragma mark - <ProductSearchResultLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  resultLayout:(ProductSearchResultLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPat{
    
    return CGSizeMake(100, 100);
}


@end




