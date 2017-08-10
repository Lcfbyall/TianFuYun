//
//  TJSProductFilterCollAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterCollAdapter.h"
#import "ProductFilterCollLayout.h"
#import "ProductFilterReusableSectionHeader.h"
#import "ProductFilterCollectionCell.h"
#import "ProductFilterItemModel.h"

static NSString *headerIdentifier = @"ProductFilterReusableSectionHeader";
static NSString *identifier = @"ProductFilterCollectionCell";


@interface TJSProductFilterCollAdapter ()<ProductFilterCollLayoutDelegate>

@property (nonatomic,weak)  UICollectionView *collectionView;

@end

@implementation TJSProductFilterCollAdapter

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{
    
    self = [super init];
    if(self){
        
        _collectionView = collectionView;
    }
    
    return self;
}

- (void)setInteractor:(id<TJSProductFilterInteractor>)interactor{
  
    _interactor = interactor;
    
    [self registerElementForCollecitonView];
}

- (void)registerElementForCollecitonView{

    
    ProductFilterCollLayout *layout = (ProductFilterCollLayout *)self.interactor.collectionViewLayout;
    layout.delegate  = self;
    layout.collectionViewWidth=SCREEN_WIDTH;
    
    _collectionView.collectionViewLayout = layout;

    [_collectionView registerClass:[ProductFilterReusableSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
  
    ProductFilterItemModel *model = [[self.interactor items] objectAtIndex:indexPath.section];
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        ProductFilterReusableSectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        
        [header tjs_bindDataToCellWithValue:model.type];
        
        return header;
    }
    
    return nil;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    

}


#pragma mark - <ProductFilterCollLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat{

  
    return CGSizeMake(80, 30);

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(ProductFilterCollLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(ProductFilterCollLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
  
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(ProductFilterCollLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(SCREEN_WIDTH, 50);
}


@end


