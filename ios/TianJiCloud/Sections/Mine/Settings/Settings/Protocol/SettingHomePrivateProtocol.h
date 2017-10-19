//
//  SettingHomePrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef SettingHomePrivateProtocol_h
#define SettingHomePrivateProtocol_h


@interface SettingHomeOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;

@end

@protocol SettingHomeDataSource <NSObject>

@optional

- (NSArray *)items;

- (void)logout:(void (^)(id))block;

- (void)uploadIcon:(UIImage *)icon block:(void (^)(id))block;

@end


@protocol SettingHomeLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol SettingHomeLayout <NSObject>

@optional

- (void)reloadTable;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<SettingHomeLayoutDelegate>)delegate;

- (void)presentImageAcitonSheet:(void (^)(id))block;


@end


#import "MineSettingViewController.h"

@interface MineSettingViewController (Interactor)

- (void)setInteractor:(id<SettingHomeInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end

#endif /* SettingHomePrivateProtocol_h */



