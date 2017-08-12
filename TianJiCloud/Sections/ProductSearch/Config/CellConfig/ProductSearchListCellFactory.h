//
//  ProductSearchListCellFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductSearchListCellLayoutConfig.h"

@class TJSProductInfoModel;
@class TJSBaseCollectionViewCell;

@interface ProductSearchListCellFactory : NSObject

@property (nonatomic,strong)ProductSearchListCellLayoutConfig *layoutConfig;

- (TJSBaseCollectionViewCell *)cellInCollectView:(UICollectionView*)collectionView
                             forProductInfoModel:(TJSProductInfoModel *)model indexPath:(NSIndexPath*)indexPath;

- (UICollectionReusableView *)supplementary:(UICollectionView *)collectionView  kind:(NSString *)kind model:(TJSProductInfoModel *)model indexPath:(NSIndexPath *)indexPath;


@end
