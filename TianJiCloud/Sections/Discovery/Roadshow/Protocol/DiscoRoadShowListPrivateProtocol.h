//
//  DiscoRoadShowListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef DiscoRoadShowListPrivateProtocol_h
#define DiscoRoadShowListPrivateProtocol_h


@protocol DiscoRoadShowListDataSource <NSObject>

@optional

//
- (void)loadRoadShow:(void (^)(NSArray *shows, NSError *error))callback;

- (NSArray *)items;

- (UICollectionViewLayout *)collectionViewLayout;


@end



@protocol DiscoRoadShowLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end
@protocol DiscoRoadShowLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<DiscoRoadShowLayoutDelegate>)delegate;

@end

#import "DiscoRoadShowListController.h"


@interface DiscoRoadShowListController(Interactor)

- (void)setInteractor:(id<DiscoRoadShowListInteractor>) interactor;

@end



#endif /* DiscoRoadShowListPrivateProtocol_h */
