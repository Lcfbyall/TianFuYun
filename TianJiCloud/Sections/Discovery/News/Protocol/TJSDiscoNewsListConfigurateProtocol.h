//
//  TJSDiscoNewsListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSDiscoNewsListConfigurateProtocol_h
#define TJSDiscoNewsListConfigurateProtocol_h


@protocol TJSDiscoveryNewsListInteractorDelegate <NSObject>

@optional


@end


@protocol TJSDiscoveryNewsListInteractor <NSObject>

@optional

//
- (void)loadNews:(void (^)(NSArray *news, NSError *error))callback;

//
- (NSArray *)items;

- (UICollectionViewLayout *)collectionViewLayout;


- (void)onViewWillAppear;

- (void)onViewDidDisappear;

@end




#endif /* TJSDiscoNewsListConfigurateProtocol_h */
