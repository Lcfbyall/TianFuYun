//
//  HomeFooterCollectionLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeFooterCollectionLayout.h"


@interface HomeFooterCollectionLayout ()

@property (strong, nonatomic) NSMutableArray *layoutInfo;


@end


@implementation HomeFooterCollectionLayout

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
    
        if(indexPath.section == 0){
        
            
            CGSize size  = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            
            if(indexPath.item == 0){
            
                layoutAttribute.frame = CGRectMake(self.insets.left, self.insets.top, size.width, size.height);
                
            }else{
            
                UICollectionViewLayoutAttributes *lastAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section]];
                
                layoutAttribute.frame =
                
                CGRectMake(
                           lastAttribute.frame.origin.x + self.insets.top,
                                                   
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
    
    return CGSizeMake(maxWidth, self.collectionView.frame.size.width);
}


@end
