//
//  DiscoveryNewsInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoveryNewsInfo.h"


@interface DiscoveryNewsInfoModel : NSObject

@property (nonatomic,strong)DiscoveryNewsInfo *newsInfo;

+ (NSMutableArray <DiscoveryNewsInfoModel *>*)configModelWithNewsInfos:(NSArray <DiscoveryNewsInfo *>*)newsInfos;

@end
