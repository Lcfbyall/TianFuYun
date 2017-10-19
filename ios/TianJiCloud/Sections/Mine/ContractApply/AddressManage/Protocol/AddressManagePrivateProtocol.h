//
//  AddressManagePrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef AddressManagePrivateProtocol_h
#define AddressManagePrivateProtocol_h


@interface AddressManageOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol AddressManageDataSource <NSObject>

@optional


- (NSArray *)items;

@end


@protocol AddressManageLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol AddressManageLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<AddressManageLayoutDelegate>)delegate;

@end


#import "AddressManageController.h"

@interface AddressManageController (Interactor)

- (void)setInteractor:(id<AddressManageInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* AddressManagePrivateProtocol_h */



