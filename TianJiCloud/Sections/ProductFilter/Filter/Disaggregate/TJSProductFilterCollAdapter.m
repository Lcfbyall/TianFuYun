//
//  TJSProductFilterCollAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterCollAdapter.h"
#import "ProductFilterCollLayout.h"
#import "ProductFilterCollectionCell.h"
#import "ProductFilterItemModel.h"

static NSString *identifier = @"ProductFilterCollectionCell";


@interface TJSProductFilterCollAdapter ()<ProductFilterLayoutDelegate>

@property (nonatomic,weak)  UICollectionView *collectionView;

@end

@implementation TJSProductFilterCollAdapter

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{
    
    self = [super init];
    if(self){
        
        _collectionView = collectionView;
        
        [self registerElementForCollecitonView];
    }
    
    return self;
}


- (void)registerElementForCollecitonView{

    ProductFilterCollLayout *layout = [[ProductFilterCollLayout alloc]init];
    layout.delegate  = self;
    layout.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.interMargin = 10;

    _collectionView.collectionViewLayout = layout;
    
    
    [_collectionView registerClass:[ProductFilterCollectionCell class] forCellWithReuseIdentifier:identifier];
    
}



#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    id<TJSProductFilterInteractor> interactor = self.interactor;
    
    return interactor.items.count;;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    id<TJSProductFilterInteractor> interactor = self.interactor;
    
     ProductFilterItemModel *model= [interactor.items objectAtIndex:section];
    
    return model.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ProductFilterItemModel *model = [[self.interactor items] objectAtIndex:indexPath.section];
    ProductFilterItem *item = [model.items objectAtIndex:indexPath.item];
    
    ProductFilterCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    //[(ProductFilterCollectionCell *)cell setDelegate:self.cellDelegate];
    
    [cell tjs_bindDataToCellWithValue:item];
    
    return cell;
}


#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    

}


#pragma mark - <ProductFilterLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

  
    return CGSizeMake(80, 30);

}



@end


