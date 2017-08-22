//
//  CumulativeInvestLayoutImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CumulativeInvestPrivateProtocol.h"

@interface CumulativeInvestLayoutImpl : NSObject<CumulativeInvestLayout>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
