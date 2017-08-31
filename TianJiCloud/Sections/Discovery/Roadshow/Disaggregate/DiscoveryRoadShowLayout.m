//
//  DiscoveryRoadShowLayout.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryRoadShowLayout.h"

@interface DiscoveryRoadShowLayout ()



@end

@implementation DiscoveryRoadShowLayout

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
        
        if(indexPath.item == 0){
            
            /*
            CGSize size =  CGSizeMake(SCREEN_WIDTH-30, (375-30)*invite_itemRatio);
            CGFloat X = 15;
            CGFloat Y = 15;
            CGFloat W = size.width;
            CGFloat H = size.height;
            layoutAttribute.frame=CGRectMake(X, Y, W, H);
            */
        }else{
            
            /*
            UICollectionViewLayoutAttributes *firstAtt = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.section]];
            
            CGSize sizeSecond = CGSizeMake((SCREEN_WIDTH-30)/2.0, invite_itemHeight);
            CGFloat X = 15;
            CGFloat Y = 15;
            CGFloat W = sizeSecond.width;
            CGFloat H = sizeSecond.height;
            
            CGFloat firstY = firstAtt.frame.origin.y;
            CGFloat firstH = firstAtt.frame.size.height;
            CGFloat firstB = firstY+firstH;
            
            layoutAttribute.frame=
            CGRectMake(
                       X+(W+1)*((indexPath.item-1)%2),
                       (firstB+Y)+(H+1)*((indexPath.item-1)/2),
                       W,
                       H);
             */
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
