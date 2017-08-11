//
//  TJSBaseCollectionViewLayout.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TJSBaseCollectionViewLayout;

@protocol TJSBaseCollectionViewLayoutDelegate <NSObject>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(TJSBaseCollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPat;

@end


@interface TJSBaseCollectionViewLayout : UICollectionViewLayout


@property (nonatomic,assign) CGFloat collectionViewWidth;

- (void)calculateLayoutAttributes;

@property (nonatomic,weak) id<TJSBaseCollectionViewLayoutDelegate> delegate;


@end
