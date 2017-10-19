//
//  ContractApplyPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractApplyPrivateProtocol_h
#define ContractApplyPrivateProtocol_h


@interface ContractApplyOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol ContractApplyDataSource <NSObject>

@optional

- (void)applyContractWithParams:(id)params callback:(void (^)(id, NSError *))callback;

- (void)searchProductWithKey:(NSString *)key callback:(void (^)(NSArray *, NSError *))callback;;

- (NSArray *)items;

@end


@protocol ContractApplyLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol ContractApplyLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<ContractApplyLayoutDelegate>)delegate;

@end


#import "ContractApplyController.h"

@interface ContractApplyController (Interactor)

- (void)setInteractor:(id<ContractApplyInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* ContractApplyPrivateProtocol_h */



