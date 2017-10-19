//
//  TJSMyOrderListInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSMyOrderListPrivateProtocol.h"


@interface TJSMyOrderListInteractorImpl : NSObject<TJSMyOrderListInteractor,TJSMyOrderListLayoutDelegate>

@property(nonatomic,weak) id<TJSMyOrderListInteractorDelegate> delegate;

@property(nonatomic,strong) id<TJSMyOrderListDataSource> dataSource;

@property(nonatomic,strong) id<TJSMyOrderListLayout> layout;


@end
