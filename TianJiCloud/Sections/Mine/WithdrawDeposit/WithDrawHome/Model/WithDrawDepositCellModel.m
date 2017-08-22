//
//  WithDrawDepositCellModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositCellModel.h"

@implementation WithDrawDepositCellModel


//
+ (NSArray <WithDrawDepositCellModel *> *)configModelsWithInfo:(id)info{


    WithDrawDepositCellModel *first = [WithDrawDepositCellModel new];
    first.bankCardInfo = nil;
    first.cellClass = @"WithDrawDepositAddBankCell";
    first.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    first.selectionStyle = UITableViewCellSelectionStyleDefault;
    first.headerFooterTitles = @[@"",@""];
    first.target = BankCardAddVC;
    WEAK_SELF(first);
    first.cellOperation = ^(id obj1, id obj2) {
        STRONG_SELF(first);
        [UIViewController tjs_pushViewController:first.target animated:YES];
    };



    WithDrawDepositCellModel *second = [WithDrawDepositCellModel new];
    second.sum = @"10000";
    second.total = @"100000";
    second.cellClass = @"WithDrawDepositSumCell";
    second.accessoryType = UITableViewCellAccessoryNone;
    second.selectionStyle = UITableViewCellSelectionStyleNone;
    second.headerFooterTitles = @[@"",@"单笔金额30万元，单日限额50万元，单月限额100万元"];
    
    return @[@[first],@[second]];
}

@end
