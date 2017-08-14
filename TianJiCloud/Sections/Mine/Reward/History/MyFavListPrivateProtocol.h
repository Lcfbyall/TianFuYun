//
//  MyFavListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef MyFavListPrivateProtocol_h
#define MyFavListPrivateProtocol_h

@class TJSProductInfo;
@class TJSProductInfoModel;

////////////////////////////////////////////////
@interface MyFavListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end

@protocol MyFavListDataSource <NSObject>

@optional

//
- (void)loadProducts:(void (^)(NSArray *products, NSError *error))callback;
- (void)deleteProducts:(NSArray <TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL success, NSError *error))callback;
//
- (MyFavListOperateResult *)deleteModel:(TJSProductInfoModel *)model;
- (MyFavListOperateResult *)deleteModels:(NSArray<TJSProductInfoModel *> *)models;

- (NSArray *)items;

@end




////////////////////////////////////////////////
@protocol MyFavListLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end

@protocol MyFavListLayout <NSObject>

@optional

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths;

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<MyFavListLayoutDelegate>)delegate;

@end



/////////////////////////////////////////////////
#import "MyFavViewController.h"

@interface MyFavViewController (Interactor)

- (void)setInteractor:(id<MyFavListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end


#endif /* MyFavListPrivateProtocol_h */
