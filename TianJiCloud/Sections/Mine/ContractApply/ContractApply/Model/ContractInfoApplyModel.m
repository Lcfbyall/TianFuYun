//
//  ContractInfoApplyModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractInfoApplyModel.h"

@implementation ContractInfoApplyModel

+ (NSArray <ContractInfoApplyModel *> *)configModels{
 
    ContractInfoApplyModel *add = [ContractInfoApplyModel new];
    add.cellClass = @"ContractApplyAddAddressCell";
    add.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    add.selectionStyle= UITableViewCellSelectionStyleDefault;
    add.target = @"AddAdressViewController";
    add.targetParams = nil;
    WEAK_SELF(add);
    add.cellOperation = ^(id obj1, id obj2) {
        STRONG_SELF(add);
        [UIViewController tjs_pushViewController:add.target animated:YES];
    };
    
    ContractInfoApplyModel *product = [ContractInfoApplyModel new];
    product.cellClass = @"ContractApplyProductNameCell";
    product.accessoryType = UITableViewCellAccessoryNone;
    product.selectionStyle= UITableViewCellSelectionStyleNone;
    
    return [NSArray arrayWithObjects:add,product, nil];
}

@end
