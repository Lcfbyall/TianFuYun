//
//  TJSMineHomePrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMineHomePrivateProtocol_h
#define TJSMineHomePrivateProtocol_h

#import "MineViewController.h"



@protocol TJSMineHomeDataSource <NSObject>

@optional


- (NSArray *)items;

@end



@protocol TJSMineHomeLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end
@protocol TJSMineHomeLayout <NSObject>


@optional

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths;

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<TJSMineHomeLayoutDelegate>)delegate;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end


@interface MineViewController (Interactor)

- (void)setInteractor:(id<TJSMineHomeInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end



#endif /* TJSMineHomePrivateProtocol_h */
