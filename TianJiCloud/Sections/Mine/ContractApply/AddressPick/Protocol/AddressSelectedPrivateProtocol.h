//
//  AddressSelectedPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef AddressSelectedPrivateProtocol_h
#define AddressSelectedPrivateProtocol_h


@interface AddressSelectedOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol AddressSelectedDataSource <NSObject>

@optional


- (NSArray *)items;

@end


@protocol AddressSelectedLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol AddressSelectedLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<AddressSelectedLayoutDelegate>)delegate;

@end


#import "AddressSelectController.h"

@interface AddressSelectController (Interactor)

- (void)setInteractor:(id<AddressSelectedInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* AddressSelectedPrivateProtocol_h */



