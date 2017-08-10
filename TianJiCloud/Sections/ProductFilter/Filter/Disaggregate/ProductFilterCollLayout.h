//
//  ProductFilterCollLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductFilterCollLayout;

@protocol ProductFilterCollLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

@optional

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(ProductFilterCollLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(ProductFilterCollLayout*)collectionViewLayout
                  minimumLineSpacingForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(ProductFilterCollLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;


@end

@interface ProductFilterCollLayout : UICollectionViewLayout

@property (nonatomic,weak) id<ProductFilterCollLayoutDelegate> delegate;

@property (nonatomic,assign) CGFloat collectionViewWidth;

- (void)calculateLayoutAttributes;

@end
