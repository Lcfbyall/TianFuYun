//
//  RewardVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RewardConfigProtocol.h"

@class RewardViewController;

@interface RewardVCConfig : NSObject<RewardConfig>

- (void)setup:(RewardViewController *)vc;

@end
