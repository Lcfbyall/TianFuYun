//
//  HomeHeaderCollectionLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeHeaderCollectionLayout.h"

@interface HomeHeaderCollectionLayout ()

@property (strong, nonatomic) NSMutableArray *layoutInfo;


@end

@implementation HomeHeaderCollectionLayout

#pragma mark - UICollectionViewLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.layoutInfo = [NSMutableArray array];
    
    
    
    NSIndexPath *indexPath;
    
    NSInteger numSections = [self.collectionView numberOfSections];
    for(NSInteger section = 0; section < numSections; section++) {
        
        NSInteger numItems = [self.collectionView numberOfItemsInSection:section];
        
        for(NSInteger item = 0; item < numItems; item++){
            
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            //供layoutAttributesForElementsInRect使用
            
            [self.layoutInfo addObject:attrs];
        }
    }
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
    
    if(layoutAttribute.representedElementCategory == UICollectionElementCategoryCell)
    {
        
        
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


@end
