//
//  TJSBaseCollectionViewLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseCollectionViewLayout.h"


@interface TJSBaseCollectionViewLayout ()


@end


@implementation TJSBaseCollectionViewLayout



#pragma mark - Public

- (void)calculateLayoutAttributes{

    [self.layoutInfo removeAllObjects];
    self.layoutInfo = nil;

    self.layoutInfo = [NSMutableArray array];

    [self.layoutInfoDic removeAllObjects];
    self.layoutInfoDic = nil;
    self.layoutInfoDic = [NSMutableDictionary dictionary];


}


#pragma mark - Private


#pragma mark - Private

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    //
    CGSize size = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]){

        size = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }

    return size;
}

- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section{

    UIEdgeInsets insetForSection = UIEdgeInsetsZero;
    if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]){

        insetForSection = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }

    return insetForSection;
}

- (CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    CGFloat minimumInteritemSpacing = 0;

    if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]){

        minimumInteritemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }

    return minimumInteritemSpacing;
}

- (CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    CGFloat minimumLineSpacing = 0;
    if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]){

        minimumLineSpacing = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    }

    return minimumLineSpacing;
}

- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section{

    CGSize headerSize = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]){

        headerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:section];
    }
    return headerSize;
}

- (CGSize)referenceSizeForFooterInSection:(NSInteger)section{

    CGSize footerSize = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(TJSBaseCollectionViewLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]){

        footerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:section];
    }

    return footerSize;
}

@end
