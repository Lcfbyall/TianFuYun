//
//  WithdrawDepositCellFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TJSBaseTableViewCell;
@class WithdrawDepositHeaderFooterView;

@interface WithdrawDepositCellFactory : NSObject

- (TJSBaseTableViewCell *)cellInTable:(UITableView*)tableView
                     forMineInfoModel:(id)model;

- (CGFloat)cellHeight:(id)model cellWidth:(CGFloat)cellWidth;


- (WithdrawDepositHeaderFooterView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section;

@end

