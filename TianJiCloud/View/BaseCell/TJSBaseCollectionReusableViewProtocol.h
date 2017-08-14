//
//  TJSBaseCollectionReusableViewProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseCollectionReusableViewProtocol_h
#define TJSBaseCollectionReusableViewProtocol_h


@protocol TJSBaseCollectionReusableViewProtocol <NSObject>

@optional

// 数据绑定赋值
- (void)tjs_bindDataToCellWithValue:(id)value;

@end


#endif /* TJSBaseCollectionReusableViewProtocol_h */
