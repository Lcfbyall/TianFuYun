//
//  ProductFilterResultPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ProductFilterResultPrivateProtocol_h
#define ProductFilterResultPrivateProtocol_h


@interface ProductFilterResultOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end


@protocol ProductFilterResultDataSource <NSObject>

@optional

- (NSArray *)items;

@end



@protocol ProductFilterResultLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol ProductFilterResultLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<ProductFilterResultLayoutDelegate>)delegate;


@end


#import "ProductFilterResultController.h"

@interface ProductFilterResultController (Interactor)

- (void)setInteractor:(id<ProductFilterResultInteractor>) interactor;

@end





#endif /* ProductFilterResultPrivateProtocol_h */
