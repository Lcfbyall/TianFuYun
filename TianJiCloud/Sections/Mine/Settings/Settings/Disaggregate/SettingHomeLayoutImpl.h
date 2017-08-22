//
//  SettingHomeLayoutImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingHomePrivateProtocol.h"

@interface SettingHomeLayoutImpl : NSObject<SettingHomeLayout>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end