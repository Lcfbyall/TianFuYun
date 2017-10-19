//
//  BankCardAddBaseTableCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddBaseTableCell.h"


@implementation BankCardAddBaseTableCell

#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
  
    self.model = (BankCardAddCellInfoModel *)value;
    
    self.accessoryType =  ((BankCardAddCellInfoModel *)value).accessoryType;
    self.selectionStyle = ((BankCardAddCellInfoModel *)value).selectionStyle;
}

@end
