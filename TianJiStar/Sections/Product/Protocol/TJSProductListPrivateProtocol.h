//
//  TJSProductListPrivateProtocol.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductListPrivateProtocol_h
#define TJSProductListPrivateProtocol_h


#import "ProductListViewController.h"

@class TJSProductInfo;
@class TJSProductInfoModel;


@interface TJSProductListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModel;

@end

@protocol TJSProductListDataSource <NSObject>

@optional

- (NSArray *)items;

//1. 删除
- (TJSProductListOperateResult *)deleteProductInfoModel:(TJSProductInfoModel *)model;
- (NSArray *)deleteModels:(NSRange)range;


//2. 更新
- (TJSProductListOperateResult *)updateProductInfoModel:(TJSProductInfoModel *)model;


@end



@protocol TJSProductListLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end
@protocol TJSProductListLayout <NSObject>

@optional
- (void)update:(NSIndexPath *)indexPath;

//- (void)insert:(NSArray *)indexPaths animated:(BOOL)animated;

- (void)remove:(NSArray *)indexPaths;


- (void)reloadTable;


- (void)setDelegate:(id<TJSProductListLayoutDelegate>)delegate;


@end


@interface ProductListViewController(Interactor)

- (void)setInteractor:(id<TJSProductListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end


#endif /* TJSProductListPrivateProtocol_h */




