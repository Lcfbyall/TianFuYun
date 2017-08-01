//
//  HomeFooterCollectionLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeFooterCollectionLayout;

@protocol HomeFooterCollectionLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(HomeFooterCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

@end



@interface HomeFooterCollectionLayout : UICollectionViewLayout

@property (nonatomic,weak) id<HomeFooterCollectionLayoutDelegate> delegate;


@property (nonatomic,assign) UIEdgeInsets insets;

@end
