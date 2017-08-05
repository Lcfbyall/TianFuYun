//
//  MineHomeInvestCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeBaseTableCell.h"


#import "TJSMineHomeCellProtocol.h"
@protocol MineHomeInvestCellDelegate <TJSMineHomeCellDelegate>

@optional

- (BOOL)onTapCellInvestItem:(NSInteger)index;

@end


@interface MineHomeInvestCell : MineHomeBaseTableCell

@end
