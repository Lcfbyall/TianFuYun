//
//  ProductFilterCollLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterCollLayout.h"

@interface ProductFilterCollLayout (){

    
}

@property (strong, nonatomic) NSMutableArray *layoutInfo;
@property (nonatomic,strong) NSMutableDictionary *layoutInfoDic;

@end

@implementation ProductFilterCollLayout

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
        NSInteger numSections = [self.collectionView numberOfSections];
        for(NSInteger section = 0; section < numSections; section++) {
            
            NSInteger numItems = [self.collectionView numberOfItemsInSection:section];
            
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


#pragma mark - Private

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    //
    CGSize size = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterCollLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]){
        
        size = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    
    return size;
}

- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section{

  UIEdgeInsets insetForSection = UIEdgeInsetsZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterCollLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]){
        
        insetForSection = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }

    return insetForSection;
}

- (CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
     CGFloat minimumInteritemSpacing = 0;

    if([self.delegate conformsToProtocol:@protocol(ProductFilterCollLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]){
        
        minimumInteritemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }
    
    return minimumInteritemSpacing;
}

- (CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section{
  
    CGFloat minimumLineSpacing = 0;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterCollLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]){
        
        minimumLineSpacing = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    }
    
    return minimumLineSpacing;
}

- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section{
    
   CGSize headerSize = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterCollLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]){
        
        headerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:section];
    }
    return headerSize;
}

- (CGSize)referenceSizeForFooterInSection:(NSInteger)section{
    
    CGSize footerSize = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterCollLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]){
        
        footerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:section];
    }
        
    return footerSize;
}

@end
