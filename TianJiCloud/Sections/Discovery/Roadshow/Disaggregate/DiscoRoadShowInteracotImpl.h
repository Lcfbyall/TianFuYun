//
//  DiscoRoadShowInteracotImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "DiscoRoadShowListConfigurateProtocol.h"
#import "DiscoRoadShowListPrivateProtocol.h"


@interface DiscoRoadShowInteracotImpl : NSObject<DiscoRoadShowListInteractor,DiscoRoadShowLayoutDelegate>

@property (nonatomic,weak) id<DiscoRoadShowListInteractorDelegate> delegate;

@property(nonatomic,strong) id<DiscoRoadShowListDataSource> dataSource;

@property(nonatomic,strong) id<DiscoRoadShowLayout> layout;


@end






