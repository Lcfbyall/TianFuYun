//
//  MineHomeHeaderCollectionLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MineHomeHeaderCollectionLayout;

@protocol MineHomeHeaderCollectionLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(MineHomeHeaderCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

@end

@interface MineHomeHeaderCollectionLayout : UICollectionViewLayout

@property (nonatomic,weak) id<MineHomeHeaderCollectionLayoutDelegate> delegate;

@property (nonatomic,assign) UIEdgeInsets insets;

@property (nonatomic,assign) CGFloat interMargin;


@end
