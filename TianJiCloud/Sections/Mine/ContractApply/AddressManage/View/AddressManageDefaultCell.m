//
//  AddressManageDefaultCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageDefaultCell.h"

@interface AddressManageDefaultCell ()


@end

@implementation AddressManageDefaultCell

#pragma mark - <TJSBaseTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
   
    [super tjs_bindDataToCellWithValue:value];
    
    AddressManageCellModel *model = (AddressManageCellModel *)value;
    
}

@end
