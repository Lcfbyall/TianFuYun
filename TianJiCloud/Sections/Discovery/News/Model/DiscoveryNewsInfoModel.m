//
//  DiscoveryNewsInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryNewsInfoModel.h"

@implementation DiscoveryNewsInfoModel

+ (NSMutableArray <DiscoveryNewsInfoModel *>*)configModelWithNewsInfos:(NSArray <DiscoveryNewsInfo *>*)newsInfos{

    NSMutableArray *newsInfoModels = [NSMutableArray array];
    [newsInfos enumerateObjectsUsingBlock:^(DiscoveryNewsInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        DiscoveryNewsInfoModel *model = [DiscoveryNewsInfoModel new];
        DiscoveryNewsInfo *newsInfo = (DiscoveryNewsInfo *)obj;
        
        model.newsInfo = newsInfo;
        
        [newsInfoModels addObject:model];
    }];

    return newsInfoModels;
}

@end
