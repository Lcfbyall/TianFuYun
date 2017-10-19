//
//  MineHomeBalanceCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeBaseTableCell.h"


@protocol MineHomeBalanceCellDelegate <TJSBaseTableViewCellDelegate>

@optional

- (BOOL)onTapCellRightWithDrawBtn:(id)obj;

@end

@interface MineHomeBalanceCell : MineHomeBaseTableCell

@end
