//
//  ProductFilterCollLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductFilterCollLayout;

@protocol ProductFilterLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(ProductFilterCollLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;


@end

@interface ProductFilterCollLayout : UICollectionViewLayout

@property (nonatomic,weak) id<ProductFilterLayoutDelegate> delegate;

@property (nonatomic,assign) UIEdgeInsets insets;

@property (nonatomic,assign) CGFloat interMargin;



@end
