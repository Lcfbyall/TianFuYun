//
//  BankCardAddPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef BankCardAddPrivateProtocol_h
#define BankCardAddPrivateProtocol_h


@interface BankCardAddOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol BankCardAddDataSource <NSObject>

@optional

- (void)addBankCard:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (void)configWithBankCardInfo:(id)bankCardInfo;

- (NSArray *)banks;

- (void)fillingBank:(NSString *)bank;

- (NSInteger)bankIndex;

- (BOOL)canCommit;

@end


@protocol BankCardAddLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol BankCardAddLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<BankCardAddLayoutDelegate>)delegate;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end


#import "BankCardAddViewController.h"

@interface BankCardAddViewController (Interactor)

- (void)setInteractor:(id<BankCardAddInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* BankCardAddPrivateProtocol_h */


