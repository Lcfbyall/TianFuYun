//
//  ContractListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractListPrivateProtocol_h
#define ContractListPrivateProtocol_h

@class ContractInfo;
@class ContractInfoModel;

@interface ContractListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end

@protocol ContractListDataSource <NSObject>

@optional

//
- (void)loadContracts:(void (^)(NSArray *products, NSError *error))callback;

- (void)deleteContracts:(NSArray <ContractInfoModel *> *)products
               callback:(void (^)(BOOL success, NSError *error))callback;

- (void)deleteContract:(ContractInfoModel *)product
              callback:(void (^)(BOOL success, NSError *error))callback;

//
- (NSArray *)items;


@end



@protocol ContractListLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end


@protocol ContractListLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<ContractListLayoutDelegate>)delegate;

@end




#import "MyContractViewController.h"

@interface MyContractViewController (Interactor)

- (void)setInteractor:(id<ContractListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end




#endif /* ContractListPrivateProtocol_h */


