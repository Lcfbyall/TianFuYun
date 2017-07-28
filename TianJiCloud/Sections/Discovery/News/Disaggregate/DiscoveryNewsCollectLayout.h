//
//  DiscoveryNewsCollectLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiscoveryNewsCollectLayout;

@protocol DiscoveryNewsCollectLayoutDelegate <NSObject>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(DiscoveryNewsCollectLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                   layout:(DiscoveryNewsCollectLayout*)collectionViewLayout
    InsetsForItemAtIndexPath:(NSIndexPath *)indexPat;



@end

@interface DiscoveryNewsCollectLayout : UICollectionViewLayout

@property (nonatomic,weak) id<DiscoveryNewsCollectLayoutDelegate> delegate;

@end
