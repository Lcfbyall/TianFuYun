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



#pragma mark - Public

- (void)calculateLayoutAttributes{


}

@end
