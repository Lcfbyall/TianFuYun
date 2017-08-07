//
//  TJSMyOrderListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMyOrderListPrivateProtocol_h
#define TJSMyOrderListPrivateProtocol_h

#import "MyOrderListViewController.h"

@class MyOrderInfo;
@class MyOrderInfoModel;

@interface TJSMyOrderListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end


@protocol TJSMyOrderListDataSource <NSObject>

@optional

//
- (void)loadOrders:(void (^)(NSArray *orders, NSError *error))callback;
- (void)deleteOrders:(NSArray <MyOrderInfoModel *> *)orders
              callback:(void (^)(BOOL success, NSError *error))callback;
//
- (NSArray *)items;
- (TJSMyOrderListOperateResult *)deleteModel:(MyOrderInfoModel *)model;
- (TJSMyOrderListOperateResult *)deleteModels:(NSArray<MyOrderInfoModel *> *)models;


@end



@protocol TJSMyOrderListLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end

@protocol TJSMyOrderListLayout <NSObject>

@optional

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths;

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<TJSMyOrderListLayoutDelegate>)delegate;

@end




@interface MyOrderListViewController(Interactor)

- (void)setInteractor:(id<TJSMyOrderListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end



#endif /* TJSMyOrderListPrivateProtocol_h */
