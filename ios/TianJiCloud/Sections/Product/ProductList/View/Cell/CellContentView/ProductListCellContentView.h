//
//  ProductListCellContentView.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TJSProductEvent;

@protocol ProductListCellContentViewDelegate <NSObject>

- (void)onCatchEvent:(TJSProductEvent *)event;


@end


@class TJSProductInfoModel;

@interface ProductListCellContentView : UIControl

@property (nonatomic,strong,readonly)  TJSProductInfoModel   *model;

@property (nonatomic,weak) id<ProductListCellContentViewDelegate> delegate;

/**
 *  初始化
 *
 */
- (instancetype)initListCellContentViewWithDefaultSize:(CGSize)size;

/**
 *  刷新方法
 *
 *  @param data 刷新数据
 */
- (void)refresh:(TJSProductInfoModel *)data;

@end
