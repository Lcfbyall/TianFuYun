//
//  ContractAddAddressPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractAddAddressPrivateProtocol_h
#define ContractAddAddressPrivateProtocol_h


@interface ContractAddAddressOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol ContractAddAddressDataSource <NSObject>

@optional


- (NSArray *)items;

@end


@protocol ContractAddAddressLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol ContractAddAddressLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<ContractAddAddressLayoutDelegate>)delegate;

@end


#import "AddAdressViewController.h"

@interface AddAdressViewController (Interactor)

- (void)setInteractor:(id<ContractAddAddressInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* ContractAddAddressPrivateProtocol_h */



