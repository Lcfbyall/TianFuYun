//
//  BankCardListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef BankCardListPrivateProtocol_h
#define BankCardListPrivateProtocol_h


@interface BankCardListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol BankCardListDataSource <NSObject>

@optional

- (void)loadBankCardList:(void (^)(id, NSError *))callback;

- (NSArray *)items;

@end


@protocol BankCardListLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol BankCardListLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<BankCardListLayoutDelegate>)delegate;

@end


#import "BackCardManagerController.h"

@interface BackCardManagerController (Interactor)

- (void)setInteractor:(id<BankCardListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* BankCardListPrivateProtocol_h */



