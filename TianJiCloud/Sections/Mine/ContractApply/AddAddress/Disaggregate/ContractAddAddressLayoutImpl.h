//
//  ContractAddAddressLayoutImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContractAddAddressPrivateProtocol.h"

@interface ContractAddAddressLayoutImpl : NSObject<ContractAddAddressLayout>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end