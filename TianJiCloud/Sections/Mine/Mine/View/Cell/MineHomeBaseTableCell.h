//
//  MineHomeBaseTableCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableViewCell.h"

#import "TJSMineHomeCellProtocol.h"

@interface MineHomeBaseTableCell : TJSBaseTableViewCell

@property (nonatomic, weak)   id<TJSMineHomeCellDelegate> delegate;


@end
