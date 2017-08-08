//
//  MyFavListPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef MyFavListPrivateProtocol_h
#define MyFavListPrivateProtocol_h


////////////////////////////////////////////////
@interface MyFavListOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end

@protocol MyFavListDataSource <NSObject>

@optional

@end




////////////////////////////////////////////////
@protocol MyFavListLayoutDelegate <NSObject>

@optional
- (void)onRefresh;
@end

@protocol MyFavListLayout <NSObject>

@optional

@end




/////////////////////////////////////////////////
#import "MyFavViewController.h"

@interface MyFavViewController (Interactor)

- (void)setInteractor:(id<MyFavListInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end


#endif /* MyFavListPrivateProtocol_h */
