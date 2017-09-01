//
//  DiscoRoadShowListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef DiscoRoadShowListConfigurateProtocol_h
#define DiscoRoadShowListConfigurateProtocol_h


@protocol DiscoRoadShowListInteractorDelegate <NSObject>

@optional


@end


@protocol DiscoRoadShowListInteractor <NSObject>

@optional

//
- (void)loadRoadShow:(void (^)(NSArray *shows, NSError *error))callback;

//
- (NSArray *)items;

- (UICollectionViewLayout *)collectionViewLayout;


- (void)onViewWillAppear;

- (void)onViewDidDisappear;

@end

#endif /* DiscoRoadShowListConfigurateProtocol_h */


