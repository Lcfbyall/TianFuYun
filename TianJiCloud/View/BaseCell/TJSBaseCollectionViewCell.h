//
//  TJSBaseCollectionViewCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/2.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TJSCollectionViewCellProtocol <NSObject>

@optional


// 数据绑定赋值
- (void)tjs_bindDataToCellWithValue:(id)value;


@end

@interface TJSBaseCollectionViewCell : UICollectionViewCell<TJSCollectionViewCellProtocol>


@end
