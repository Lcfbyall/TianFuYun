//
//  MyFavListInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyFavListConfigurateProtocol.h"
#import "MyFavListPrivateProtocol.h"

@interface MyFavListInteractorImpl : NSObject<MyFavListInteractor,MyFavListLayoutDelegate>

@property(nonatomic,weak) id<MyFavListInteractorDelegate> delegate;

@property(nonatomic,strong) id<MyFavListDataSource> dataSource;

@property(nonatomic,strong) id<MyFavListLayout> layout;



@end
