//
//  HomeHeaderCollectionLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeHeaderCollectionLayout.h"

@interface HomeHeaderCollectionLayout ()



@end

@implementation HomeHeaderCollectionLayout

#pragma mark - UICollectionViewLayout



- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];
    [self.layoutInfo enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            
            //屏幕中间
            CGFloat centerX = self.collectionView.contentOffset.x + self.collectionViewWidth/2;
            //item中间
            CGFloat attributesX = attributes.center.x;
            CGFloat delta = centerX - attributesX;
            CGFloat itemWidth = attributes.frame.size.width;
            
            attributes.zIndex = - ABS(delta);
            CGFloat ratio     =  - delta / (itemWidth*2);
            CGFloat scale     = 1 - ABS(delta) / (itemWidth *8) * cos(ratio * M_PI_4);
            attributes.transform = CGAffineTransformMakeScale(scale, scale);
            [allAttributes addObject:attributes];
        }
    }];
    
    return allAttributes;
}


- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *layoutAttribute =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if(layoutAttribute.representedElementCategory == UICollectionElementCategoryCell){
        
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


//控制控制最后UICollectionView的最后去哪里，我们这里需要做的吸附效果的逻辑代码就需要在这里完成。
//参数介绍proposedContentOffset:原本UICollectionView停止滚动那一刻的位置；
//velocity：滚动速度

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    //1.计算scrollview最后停留的范围
    CGRect lastRect ;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    //2.取出这个范围内的所有属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    //计算屏幕最中间的x
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width / 2 ;
    
    //3.遍历所有的属性
    CGFloat adjustOffsetX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        if(ABS(attrs.center.x - centerX) < ABS(adjustOffsetX)){//取出最小值
            adjustOffsetX = attrs.center.x - centerX;
        }
    }

    return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y);
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
            
            for(NSInteger item = 0; item < numItems; item++){
                
                indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                
                UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
                
                //供layoutAttributesForElementsInRect使用
                
                [self.layoutInfo addObject:attrs];
            }
        }
    
    
    }
}

@end
