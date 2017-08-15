//
//  ContractApplyCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyCellFactory.h"

#import "TJSBaseTableViewCell.h"


@implementation ContractApplyCellFactory

+ (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                     forMineInfoModel:(id)model{

    return [[TJSBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aa"];

}

@end
