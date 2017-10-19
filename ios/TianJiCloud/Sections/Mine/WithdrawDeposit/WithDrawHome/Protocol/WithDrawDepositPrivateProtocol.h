//
//  WithDrawDepositPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef WithDrawDepositPrivateProtocol_h
#define WithDrawDepositPrivateProtocol_h


@interface WithDrawDepositOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol WithDrawDepositDataSource <NSObject>

@optional

- (void)withDrawForFree:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (void)configWithData:(id)data;

- (BOOL)canCommit;

@end


@protocol WithDrawDepositLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol WithDrawDepositLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<WithDrawDepositLayoutDelegate>)delegate;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;


@end


#import "WithDrawDepositController.h"

@interface WithDrawDepositController (Interactor)

- (void)setInteractor:(id<WithDrawDepositInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* WithDrawDepositPrivateProtocol_h */



