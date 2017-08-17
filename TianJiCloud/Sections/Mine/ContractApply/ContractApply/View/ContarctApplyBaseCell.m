//
//  ContarctApplyBaseCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContarctApplyBaseCell.h"
#import "ContractInfoApplyModel.h"

@interface ContarctApplyBaseCell ()

@end

@implementation ContarctApplyBaseCell


#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    ContractInfoApplyModel *model = (ContractInfoApplyModel *)value;
    self.accessoryType = model.accessoryType;
    self.selectionStyle = model.selectionStyle;

    
}


@end
