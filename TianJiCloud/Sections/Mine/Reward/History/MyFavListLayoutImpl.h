//
//  MyFavListLayoutImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyFavListPrivateProtocol.h"

@interface MyFavListLayoutImpl : NSObject<MyFavListLayout>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
