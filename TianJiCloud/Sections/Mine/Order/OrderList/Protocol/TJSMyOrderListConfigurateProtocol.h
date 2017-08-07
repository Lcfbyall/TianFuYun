//
//  TJSMyOrderListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMyOrderListConfigurateProtocol_h
#define TJSMyOrderListConfigurateProtocol_h


@protocol TJSMyOrderListInteractorDelegate <NSObject>

@optional



@end


@protocol TJSMyOrderListInteractor

- (void)loadOrders:(void (^)(NSArray *orders, NSError *error))callback;

- (NSArray *)items;

- (void)onViewWillAppear;

- (void)onViewDidDisappear;


@end

#endif /* TJSMyOrderListConfigurateProtocol_h */
