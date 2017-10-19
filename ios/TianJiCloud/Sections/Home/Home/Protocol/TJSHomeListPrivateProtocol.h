//
//  TJSHomeListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSHomeListPrivateProtocol_h
#define TJSHomeListPrivateProtocol_h


#import "HomeViewController.h"

@class TJSProductInfo;
@class TJSProductInfoModel;

////////////////////////////////////////////////
@interface TJSHomeListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end

@protocol TJSHomeListDataSource <NSObject>

@optional

//
- (void)loadProducts:(void (^)(NSArray *products, NSError *error))callback;

- (void)deleteProducts:(NSArray <TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL success, NSError *error))callback;
//
- (TJSHomeListOperateResult *)deleteModel:(TJSProductInfoModel *)model;

- (TJSHomeListOperateResult *)deleteModels:(NSArray<TJSProductInfoModel *> *)models;

- (NSArray *)items;

- (id)headerItems;

- (id)footerItems;

@end




////////////////////////////////////////////////
@protocol TJSHomeListLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end

@protocol TJSHomeListLayout <NSObject>

@optional

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths;

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<TJSHomeListLayoutDelegate>)delegate;


@end




/////////////////////////////////////////////////

@interface HomeViewController (Interactor)

- (void)setInteractor:(id<TJSHomeListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* TJSHomeListPrivateProtocol_h */


