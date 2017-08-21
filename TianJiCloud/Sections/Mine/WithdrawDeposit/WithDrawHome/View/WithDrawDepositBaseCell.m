//
//  WithDrawDepositBaseCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositBaseCell.h"

@interface WithDrawDepositBaseCell ()


@end


@implementation WithDrawDepositBaseCell


#pragma mark - TJSBaseTableViewCellProtocol

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.model = (WithDrawDepositCellModel *)value;
    self.accessoryType = self.model.accessoryType;
    self.selectionStyle = self.model.selectionStyle;

}


@end
