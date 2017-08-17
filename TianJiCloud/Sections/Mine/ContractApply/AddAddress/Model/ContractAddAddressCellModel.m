//
//  ContractAddAddressCellModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressCellModel.h"

@implementation ContractAddAddressCellModel

+ (NSArray <ContractAddAddressCellModel *> *)configModels{
 
    
    ContractAddAddressCellModel *receipt = [ContractAddAddressCellModel new];
    receipt.cellClass = @"ConAddressRightInputCell";
    receipt.placeHolder = @"请输入收件人姓名";
    receipt.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    receipt.selectionStyle= UITableViewCellSelectionStyleDefault;
    
    
    ContractAddAddressCellModel *mobile = [ContractAddAddressCellModel new];
    mobile.cellClass = @"ConAddressRightInputCell";
    mobile.placeHolder = @"请输入收件人手机号";
    mobile.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    mobile.selectionStyle= UITableViewCellSelectionStyleDefault;
    

    ContractAddAddressCellModel *region = [ContractAddAddressCellModel new];
    region.cellClass = @"ConAddressMiddleLabelCell";
    region.placeHolder = @"请选择区域";
    region.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    region.selectionStyle= UITableViewCellSelectionStyleDefault;
   
    
    ContractAddAddressCellModel *address = [ContractAddAddressCellModel new];
    address.cellClass = @"ConAddressBottomInputCell";
    address.placeHolder = @"请输入收件地址";
    address.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    address.selectionStyle= UITableViewCellSelectionStyleDefault;
    
    
    ContractAddAddressCellModel *postalcode = [ContractAddAddressCellModel new];
    postalcode.cellClass = @"ConAddressRightInputCell";
    postalcode.placeHolder = @"请输入邮政编码";
    postalcode.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    postalcode.selectionStyle= UITableViewCellSelectionStyleDefault;
    
    
    return [NSArray arrayWithObjects:receipt,mobile,region,address,postalcode, nil];
}

@end
