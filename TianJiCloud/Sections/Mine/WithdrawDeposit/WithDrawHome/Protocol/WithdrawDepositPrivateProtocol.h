//
//  WithdrawDepositPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef WithdrawDepositPrivateProtocol_h
#define WithdrawDepositPrivateProtocol_h


@interface WithdrawDepositOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol WithdrawDepositDataSource <NSObject>

@optional

- (void)addBankCard:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (void)configWithBankCardInfo:(id)bankCardInfo;

- (NSArray *)banks;

- (void)fillingBank:(NSString *)bank;

- (NSInteger)bankIndex;

- (BOOL)canCommit;

@end


@protocol WithdrawDepositLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol WithdrawDepositLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<WithdrawDepositLayoutDelegate>)delegate;

@end


#import "WithdrawDepositController.h"

@interface WithdrawDepositController (Interactor)

- (void)setInteractor:(id<WithdrawDepositInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* WithdrawDepositPrivateProtocol_h */



