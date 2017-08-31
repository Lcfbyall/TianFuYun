//
//  DiscoveryNewsCollectLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryNewsCollectLayout.h"

@interface DiscoveryNewsCollectLayout ()


@end


@implementation DiscoveryNewsCollectLayout

#pragma mark - UICollectionViewLayout



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
    
    if(layoutAttribute.representedElementCategory == UICollectionElementCategoryCell)
    {
        if(indexPath.section == 0){

            CGSize size         = [self.delegate collectionView:self.collectionView
                                                         layout:self
                                         sizeForItemAtIndexPath:indexPath];
            
            UIEdgeInsets insets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];


            
            if(indexPath.item == 0 ){
                
                layoutAttribute.frame = CGRectMake(insets.left, insets.top, size.width, size.height);
            
            }else{
                
                UICollectionViewLayoutAttributes *lastAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section]];
            
                
                layoutAttribute.frame = CGRectMake(insets.left, lastAttribute.frame.origin.y + lastAttribute.frame.size.height + insets.top, size.width, size.height);
                
            }
        }
    }
    
    return layoutAttribute;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

- (CGSize)collectionViewContentSize{
    
    CGFloat maxHeight = 0;
    UICollectionViewLayoutAttributes *attributes = [self.layoutInfo lastObject];
    maxHeight = attributes.frame.origin.y + attributes.frame.size.height + 15;
    
    return CGSizeMake(self.collectionView.frame.size.width, maxHeight);
}


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
            
            NSInteger numItems =  [self.delegate collectionView:self.collectionView numberOfItemsInSection:section layout:self];
            
            for(NSInteger item = 0; item < numItems; item++){
                
                indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                
                UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
                
                //供layoutAttributesForElementsInRect使用
                
                [self.layoutInfo addObject:attrs];
                [self.layoutInfoDic setObject:attrs forKey:indexPath];
            }
        }
        
    }

}

@end
