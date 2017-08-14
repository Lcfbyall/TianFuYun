//
//  TJSBaseCollectionViewLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TJSBaseCollectionViewLayout;

@protocol TJSBaseCollectionViewLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(TJSBaseCollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

@optional

@optional

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(TJSBaseCollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(TJSBaseCollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(TJSBaseCollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(TJSBaseCollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(TJSBaseCollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;



@end


@interface TJSBaseCollectionViewLayout : UICollectionViewLayout


@property (nonatomic,assign) CGFloat collectionViewWidth;

- (void)calculateLayoutAttributes;

@property (nonatomic,weak) id<TJSBaseCollectionViewLayoutDelegate> delegate;

@property (nonatomic,assign) UIEdgeInsets insets;

@property (nonatomic,assign) CGFloat interMargin;

@property (strong, nonatomic) NSMutableArray *layoutInfo;
@property (nonatomic,strong) NSMutableDictionary *layoutInfoDic;


- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section;
- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section;
- (CGSize)referenceSizeForFooterInSection:(NSInteger)section;


@end
