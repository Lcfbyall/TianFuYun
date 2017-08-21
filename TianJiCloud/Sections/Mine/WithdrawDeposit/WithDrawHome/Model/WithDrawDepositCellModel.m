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

    first.cellClass = @"WithDrawDepositAddBankCell";

    first.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    first.selectionStyle = UITableViewCellSelectionStyleDefault;

    first.target = BankCardAddVC;

    WEAK_SELF(first);
    first.cellOperation = ^(id obj1, id obj2) {

        STRONG_SELF(first);
        [UIViewController tjs_popViewController:first.target animated:YES];
    };


    

    WithDrawDepositCellModel *second = [WithDrawDepositCellModel new];

    second.cellClass = @"WithDrawDepositSumCell";

    second.accessoryType = UITableViewCellAccessoryNone;

    second.selectionStyle = UITableViewCellSelectionStyleNone;
    



    return @[@[first],@[second]];
}

@end
