//
//  ProductSearchHotLayout.h
//  TianJiCloud
//
//  Created by staff on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ProductSearchHotLayout;
@protocol ProductSearchHotLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  hotLayout:(ProductSearchHotLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;


@end


@interface ProductSearchHotLayout : UICollectionViewLayout




@end
