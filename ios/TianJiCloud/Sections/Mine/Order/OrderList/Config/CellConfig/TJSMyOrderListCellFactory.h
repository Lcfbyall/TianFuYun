//
//  TJSMyOrderListCellFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseTableViewCell.h"

@interface TJSMyOrderListCellFactory : NSObject

- (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                      forOrderInfoModel:(id)model;


@end
