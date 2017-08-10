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


@end

@implementation ProductFilterCollLayout

- (void)prepareLayout{
    [super prepareLayout];

    self.layoutInfo = [NSMutableArray array];
    
    NSIndexPath *indexPath;
    NSInteger numSections = [self.collectionView numberOfSections];
    for(NSInteger section = 0; section < numSections; section++) {
        
        NSInteger numItems = [self.collectionView numberOfItemsInSection:section];
        
        indexPath = [NSIndexPath indexPathWithIndex:section];
        
        UICollectionViewLayoutAttributes *headerAtt = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        
        [self.layoutInfo addObject:headerAtt];
        
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
    
    //UICollectionViewLayoutAttributes
    UICollectionViewLayoutAttributes *layoutAttribute =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if(layoutAttribute.representedElementCategory == UICollectionElementCategoryCell){
        
        CGSize size = [self sizeForItemAtIndexPath:indexPath];
        UIEdgeInsets insetForSection = [self insetForSectionAtIndex:indexPath.section];
        CGFloat minimumInteritemSpacing = [self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
        //CGFloat minimumLineSpacing = [self minimumLineSpacingForSectionAtIndex:indexPath.section];
        
        if(indexPath.item == 0 ){
            layoutAttribute.frame = CGRectMake(insetForSection.left, insetForSection.top, size.width, size.height);
        }else{
            
            UICollectionViewLayoutAttributes *lastAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section]];
            
            
            layoutAttribute.frame =
            CGRectMake(lastAttribute.frame.origin.x + lastAttribute.frame.size.width + minimumInteritemSpacing,
                       
                       lastAttribute.frame.origin.y + lastAttribute.frame.size.height + insetForSection.top,
                       size.width,
                       size.height);
            
        }
    }
    return layoutAttribute;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    
    //NSInteger itemsInSection = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    if([elementKind isEqualToString:UICollectionElementKindSectionHeader]){
    
        CGSize headerSize = [self referenceSizeForHeaderInSection:indexPath.section];
        
        layoutAttributes.frame = CGRectMake(0, 0, headerSize.width, headerSize.height);
    
    }else{
    
        
    
    }
    
    return layoutAttributes;
}

/*
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath{
 
    //UICollectionViewLayoutAttributes
    + (instancetype)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath;
}
*/

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



#pragma mark - Private

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    //
    CGSize size = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]){
        
        size = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    
    return size;
}

- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section{

  UIEdgeInsets insetForSection = UIEdgeInsetsZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]){
        
        insetForSection = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }

    return insetForSection;
}

- (CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
     CGFloat minimumInteritemSpacing = 0;

    if([self.delegate conformsToProtocol:@protocol(ProductFilterLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]){
        
        minimumInteritemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }
    
    return minimumInteritemSpacing;
}

- (CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section{
  
    CGFloat minimumLineSpacing = 0;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]){
        
        minimumLineSpacing = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    }
    
    return minimumLineSpacing;
}

- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section{
    
   CGSize headerSize = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]){
        
        headerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:section];
    }
    return headerSize;
}

- (CGSize)referenceSizeForFooterInSection:(NSInteger)section{
    
    CGSize footerSize = CGSizeZero;
    if([self.delegate conformsToProtocol:@protocol(ProductFilterLayoutDelegate)] && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]){
        
        footerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:section];
    }
        
    return footerSize;
}

@end
