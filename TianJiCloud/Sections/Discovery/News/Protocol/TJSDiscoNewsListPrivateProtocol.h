//
//  TJSDiscoNewsListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSDiscoNewsListPrivateProtocol_h
#define TJSDiscoNewsListPrivateProtocol_h


@protocol TJSDiscoveryNewsListDataSource <NSObject>

@optional

//
- (void)loadNews:(void (^)(NSArray *news, NSError *error))callback;

- (NSArray *)items;

@end



@protocol TJSDiscoNewsLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end
@protocol TJSDiscoNewsLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<TJSDiscoNewsLayoutDelegate>)delegate;

@end

#import "DiscoNewsListController.h"


@interface DiscoNewsListController(Interactor)

- (void)setInteractor:(id<TJSDiscoveryNewsListInteractor>) interactor;

@end



#endif /* TJSDiscoNewsListPrivateProtocol_h */
