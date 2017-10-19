//
//  CumulativeInvestPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef CumulativeInvestPrivateProtocol_h
#define CumulativeInvestPrivateProtocol_h

#import "PNPieChartDataItem.h"

@interface CumulativeInvestOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol CumulativeInvestDataSource <NSObject>

@optional

- (void)loadInvest:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (NSString *)totalInvest;

- (NSArray <PNPieChartDataItem *>*)pieItems;

@end


@protocol CumulativeInvestLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol CumulativeInvestLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<CumulativeInvestLayoutDelegate>)delegate;

@end


#import "CumulativeInvestController.h"

@interface CumulativeInvestController (Interactor)

- (void)setInteractor:(id<CumulativeInvestInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* CumulativeInvestPrivateProtocol_h */



