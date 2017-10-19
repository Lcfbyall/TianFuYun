//
//  ContractListCellFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TJSBaseTableViewCell;

@interface ContractListCellFactory : NSObject

+ (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                      forMineInfoModel:(id)model;

//- (UITableViewHeaderFooterView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section;

@end
