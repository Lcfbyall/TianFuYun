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

- (void)prepareLayout{
    [super prepareLayout];
    


}



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



    }

    return layoutAttribute;
}


- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];

    if([elementKind isEqualToString:UICollectionElementKindSectionHeader]){



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


}

@end
