//
//  ContractAddAddressBaseCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressBaseCell.h"

#import "ContractAddAddressCellModel.h"

@implementation ContractAddAddressBaseCell

#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    ContractAddAddressCellModel *model = (ContractAddAddressCellModel *)value;
    self.accessoryType = model.accessoryType;
    self.selectionStyle = model.selectionStyle;
    
    
}

@end
