//
//  TJSBaseCollectionViewCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TJSCollectionViewCellProtocol <NSObject>

@optional

// 注册并创建 cell
+ (instancetype)tjs_makeCellForAllocCollectionView:(UICollectionView *)collectionView;

// 注册并创建 xib cell
+ (instancetype)tjs_makeCellForNibCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

// 数据绑定赋值
- (void)tjs_bindDataToCellWithValue:(id)value;

@end


@interface TJSBaseCollectionViewCell : UICollectionViewCell<TJSCollectionViewCellProtocol>

@end



