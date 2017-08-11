//
//  TJSBaseCollectionReusableView.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TJSBaseCollectionReusableViewProtocol <NSObject>

@optional

// 数据绑定赋值
- (void)tjs_bindDataToCellWithValue:(id)value;

@end


@interface TJSBaseCollectionReusableView : UICollectionReusableView<TJSBaseCollectionReusableViewProtocol>

@end
