//
//  TJSProductListPrivateProtocol.h
//  TianJiCloud
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

@property (nonatomic,copy) NSArray *productInfoModels;
@end

@protocol TJSProductListDataSource <NSObject>

@optional
//
- (void)loadProducts:(void (^)(NSArray *products, NSError *error))callback;
- (void)deleteProducts:(NSArray <TJSProductInfoModel *> *)products
             callback:(void (^)(BOOL success, NSError *error))callback;
//
- (TJSProductListOperateResult *)deleteModel:(TJSProductInfoModel *)model;
- (TJSProductListOperateResult *)deleteModels:(NSArray<TJSProductInfoModel *> *)models;

- (NSArray *)items;

@end



@protocol TJSProductListLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end
@protocol TJSProductListLayout <NSObject>

@optional

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths;

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<TJSProductListLayoutDelegate>)delegate;


@end


@interface ProductListViewController(Interactor)

- (void)setInteractor:(id<TJSProductListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end


#endif /* TJSProductListPrivateProtocol_h */




