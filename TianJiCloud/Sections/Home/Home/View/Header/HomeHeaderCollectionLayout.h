//
//  HomeHeaderCollectionLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeHeaderCollectionLayout;

@protocol HomeHeaderCollectionLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(HomeHeaderCollectionLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

@end

@interface HomeHeaderCollectionLayout : UICollectionViewLayout

@property (nonatomic,weak) id<HomeHeaderCollectionLayoutDelegate> delegate;

@end
