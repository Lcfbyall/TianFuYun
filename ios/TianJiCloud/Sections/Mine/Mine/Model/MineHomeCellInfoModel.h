//
//  MineHomeCellInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MineHomeCellInfo.h"

@interface MineHomeCellInfoModel : NSObject

- (void)configItems;

- (MineHomeCellInfo *)balance;

- (void)configBalance;

@property(nonatomic,strong,readonly)NSMutableArray *items;

@end
