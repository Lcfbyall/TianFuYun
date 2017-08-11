//
//  ProductSearchResultLayout.h
//  TianJiCloud
//
//  Created by staff on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ProductSearchResultLayout;

@protocol ProductSearchResultLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  resultLayout:(ProductSearchResultLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;


@end



@interface ProductSearchResultLayout : UICollectionViewLayout



@end
