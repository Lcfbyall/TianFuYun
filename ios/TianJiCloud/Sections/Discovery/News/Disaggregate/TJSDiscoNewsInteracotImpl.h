//
//  TJSDiscoNewsInteracotImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "TJSDiscoNewsListConfigurateProtocol.h"
#import "TJSDiscoNewsListPrivateProtocol.h"


@interface TJSDiscoNewsInteracotImpl : NSObject<TJSDiscoveryNewsListInteractor,TJSDiscoNewsLayoutDelegate>

@property (nonatomic,weak) id<TJSDiscoveryNewsListInteractorDelegate> delegate;

@property(nonatomic,strong) id<TJSDiscoveryNewsListDataSource> dataSource;

@property(nonatomic,strong) id<TJSDiscoNewsLayout> layout;


@end






