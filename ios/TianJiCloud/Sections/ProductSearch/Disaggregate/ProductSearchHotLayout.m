//
//  ProductSearchHotLayout.m
//  TianJiCloud
//
//  Created by staff on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchHotLayout.h"

@interface ProductSearchHotLayout ()



@end

@implementation ProductSearchHotLayout



- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];

    [self.layoutInfo enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL * _Nonnull stop) {

        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [allAttributes addObject:attributes];
        }
    }];

    return allAttributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewLayoutAttributes *layoutAttribute =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    if(layoutAttribute.representedElementCategory == UICollectionElementCategoryCell){


        NSIndexPath *headerIndexPath = [NSIndexPath indexPathWithIndex:indexPath.section];
        UICollectionViewLayoutAttributes *headerAttribute = [self.layoutInfoDic objectForKey:headerIndexPath];


        CGSize size = [self sizeForItemAtIndexPath:indexPath];
        UIEdgeInsets insetForSection = [self insetForSectionAtIndex:indexPath.section];
        CGFloat minimumInteritemSpacing = [self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
        CGFloat minimumLineSpacing = [self minimumLineSpacingForSectionAtIndex:indexPath.section];

        if(indexPath.item == 0 ){

            CGFloat Y = headerAttribute.frame.origin.y+headerAttribute.frame.size.height+insetForSection.top;
            layoutAttribute.frame = CGRectMake(insetForSection.left, Y, size.width, size.height);
        }else{

            NSIndexPath *lastItemOfSection = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
            UICollectionViewLayoutAttributes *lastAttribute = [self.layoutInfoDic objectForKey:lastItemOfSection];

            CGFloat X = 0;
            CGFloat Y = 0;
            CGFloat now = lastAttribute.frame.origin.x + lastAttribute.frame.size.width + minimumInteritemSpacing + size.width + insetForSection.right;
            if(now<=self.collectionViewWidth){

                X = lastAttribute.frame.origin.x+lastAttribute.frame.size.width+minimumInteritemSpacing;
                Y = lastAttribute.frame.origin.y;
            }else{

                X = insetForSection.left;
                Y = lastAttribute.frame.origin.y+lastAttribute.frame.size.height+minimumLineSpacing;
            }

            layoutAttribute.frame = CGRectMake(X, Y, size.width, size.height);
        }

    }

    return layoutAttribute;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{


    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    if([elementKind isEqualToString:UICollectionElementKindSectionHeader]){

        CGSize headerSize = [self referenceSizeForHeaderInSection:indexPath.section];

        if(indexPath.section == 0){

            layoutAttributes.frame = CGRectMake(0, 0, headerSize.width, headerSize.height);
        }else{

            NSInteger lastSection = indexPath.section-1;
            NSInteger itemsInLastSection = [self.collectionView numberOfItemsInSection:lastSection];
            NSIndexPath *lastSectionLastItemIndexPath = [NSIndexPath indexPathForItem:itemsInLastSection-1 inSection:lastSection];

            UICollectionViewLayoutAttributes *lastItem = [self.layoutInfoDic objectForKey:lastSectionLastItemIndexPath];
            UIEdgeInsets insetForSection = [self insetForSectionAtIndex:indexPath.section];
            layoutAttributes.frame = CGRectMake(0, lastItem.frame.origin.y+lastItem.size.height+insetForSection.bottom, headerSize.width, headerSize.height);
        }

    }

    return layoutAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return NO;
}

- (CGSize)collectionViewContentSize{

    CGFloat maxHeight = 0;
    UICollectionViewLayoutAttributes *attributes = [self.layoutInfo lastObject];
    maxHeight = attributes.frame.origin.y + attributes.frame.size.height + 15;

    return CGSizeMake(self.collectionViewWidth, maxHeight);
}


#pragma mark - Public

- (void)calculateLayoutAttributes{
    
    [self.layoutInfo removeAllObjects];
    self.layoutInfo = nil;

    self.layoutInfo = [NSMutableArray array];

    [self.layoutInfoDic removeAllObjects];
    self.layoutInfoDic = nil;
    self.layoutInfoDic = [NSMutableDictionary dictionary];


    @autoreleasepool {

        NSIndexPath *indexPath;
        NSInteger numSections = [self.delegate numberOfSectionsInCollectionView:self.collectionView layout:self];
        
        for(NSInteger section = 0; section < numSections; section++) {

            NSInteger numItems = [self.delegate collectionView:self.collectionView numberOfItemsInSection:section layout:self];

            indexPath = [NSIndexPath indexPathWithIndex:section];
            UICollectionViewLayoutAttributes *headerAtt = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
            [self.layoutInfo addObject:headerAtt];
            [self.layoutInfoDic setObject:headerAtt forKey:indexPath];

            for(NSInteger item = 0; item < numItems; item++){

                indexPath = [NSIndexPath indexPathForItem:item inSection:section];

                UICollectionViewLayoutAttributes *itemAttrs = [self layoutAttributesForItemAtIndexPath:indexPath];

                //供layoutAttributesForElementsInRect使用
                [self.layoutInfo addObject:itemAttrs];
                [self.layoutInfoDic setObject:itemAttrs forKey:indexPath];
            }
        }
    }
}

@end