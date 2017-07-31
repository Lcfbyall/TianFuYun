//
//  TJSMineHomeCellFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MineHomeBaseTableCell;


@interface TJSMineHomeCellFactory : NSObject

- (MineHomeBaseTableCell *)cellInTable:(UITableView*)tableView
                      forMineInfoModel:(id)model;

@end
