//
//  MineHomeInvestCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeBaseTableCell.h"


@protocol MineHomeInvestCellDelegate <TJSBaseTableViewCellDelegate>

@optional

- (BOOL)onTapCellInvestItem:(NSInteger)index;

@end


@interface MineHomeInvestCell : MineHomeBaseTableCell

@end
