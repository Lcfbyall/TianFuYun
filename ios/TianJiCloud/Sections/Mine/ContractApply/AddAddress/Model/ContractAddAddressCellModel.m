//
//  ContractAddAddressCellModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressCellModel.h"

@implementation ContractAddAddressCellModel

+ (NSArray <ContractAddAddressCellModel *> *)configModelsWithAddress:(ContractAddressInfo *)addressInfo{
 
    ContractAddAddressCellModel *receipt = [ContractAddAddressCellModel new];
    receipt.cellClass = @"ConAddressRightInputCell";
    receipt.leftValue = @"收件人";
    receipt.rightValue = addressInfo.receipt;
    receipt.rightPlaceHolder = @"请输入收件人姓名";
    receipt.leftValueColor = ThemeService.text_color_00;
    receipt.rightValueColor = ThemeService.text_color_01;
    receipt.leftValueFont = [UIFont systemFontOfSize:14.0f];
    receipt.rightValueFont = [UIFont systemFontOfSize:14.0f];
    receipt.accessoryType = UITableViewCellAccessoryNone;
    receipt.selectionStyle= UITableViewCellSelectionStyleNone;
    
    
    ContractAddAddressCellModel *mobile = [ContractAddAddressCellModel new];
    mobile.cellClass = @"ConAddressRightInputCell";
    mobile.leftValue = @"手机号码";
    mobile.rightValue = addressInfo.mobile;
    mobile.rightPlaceHolder = @"请输入收件人手机号";
    mobile.leftValueColor = ThemeService.text_color_00;
    mobile.rightValueColor = ThemeService.text_color_01;
    mobile.leftValueFont = [UIFont systemFontOfSize:14.0f];
    mobile.rightValueFont = [UIFont systemFontOfSize:14.0f];
    mobile.accessoryType = UITableViewCellAccessoryNone;
    mobile.selectionStyle= UITableViewCellSelectionStyleNone;
    

    ContractAddAddressCellModel *region = [ContractAddAddressCellModel new];
    region.cellClass = @"ConAddressMiddleLabelCell";
    region.leftValue = @"区域";
    region.rightPlaceHolder = @"请选择区域";
    region.rightValue = addressInfo.receipt.length?addressInfo.region:@"请选择区域";
    region.leftValueColor = ThemeService.text_color_00;
    region.rightValueColor = ThemeService.text_color_01;
    region.rightPlaceColor = ThemeService.text_color_01;
    region.leftValueFont = [UIFont systemFontOfSize:14.0f];
    region.rightValueFont = [UIFont systemFontOfSize:14.0f];
    region.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    region.selectionStyle= UITableViewCellSelectionStyleDefault;
   
    
    ContractAddAddressCellModel *address = [ContractAddAddressCellModel new];
    address.cellClass = @"ConAddressBottomInputCell";
    address.leftValue = @"地址";
    address.rightValue = addressInfo.address;
    address.rightPlaceHolder = @"请输入收件地址";
    address.leftValueColor = ThemeService.text_color_00;
    address.rightValueColor = ThemeService.text_color_01;
    address.leftValueFont = [UIFont systemFontOfSize:14.0f];
    address.rightValueFont = [UIFont systemFontOfSize:14.0f];
    address.accessoryType = UITableViewCellAccessoryNone;
    address.selectionStyle= UITableViewCellSelectionStyleNone;
    
    
    ContractAddAddressCellModel *postalcode = [ContractAddAddressCellModel new];
    postalcode.cellClass = @"ConAddressRightInputCell";
    postalcode.leftValue = @"邮政编码";
    postalcode.rightValue = addressInfo.postalcode;
    postalcode.rightPlaceHolder = @"请输入邮政编码";
    postalcode.leftValueColor = ThemeService.text_color_00;
    postalcode.rightValueColor = ThemeService.text_color_01;
    postalcode.leftValueFont = [UIFont systemFontOfSize:14.0f];
    postalcode.rightValueFont = [UIFont systemFontOfSize:14.0f];
    postalcode.accessoryType = UITableViewCellAccessoryNone;
    postalcode.selectionStyle= UITableViewCellSelectionStyleNone;
    
    
    return [NSArray arrayWithObjects:receipt,mobile,region,address,postalcode, nil];
}

@end
