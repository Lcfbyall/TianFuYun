//
//  HomeFooterCollectionLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeFooterCollectionLayout.h"


@interface HomeFooterCollectionLayout ()


@end


@implementation HomeFooterCollectionLayout

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
        
            
            CGSize size  = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            
            if(indexPath.item == 0){
            
                layoutAttribute.frame = CGRectMake(self.insets.left, self.insets.top, size.width, size.height);
                
            }else{
            
                UICollectionViewLayoutAttributes *lastAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section]];
                
                layoutAttribute.frame =
                
                CGRectMake(
                           lastAttribute.frame.origin.x + lastAttribute.frame.size.width + self.interMargin,
                                                   
                           lastAttribute.frame.origin.y,
                           
                           size.width,
                           
                           size.height);
                
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
    
    CGFloat maxWidth = 0;
    
    UICollectionViewLayoutAttributes *attributes = [self.layoutInfo lastObject];
    
    maxWidth = attributes.frame.origin.x + attributes.frame.size.width + self.insets.right;
    
    return CGSizeMake(maxWidth, self.collectionView.frame.size.height);
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
            
            NSInteger numItems = [self.delegate collectionView:self.collectionView numberOfItemsInSection:section layout:self];
            
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
