//
//  BankCardInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardInfoModel.h"

@implementation BankCardInfoModel

+ (NSArray <BankCardInfoModel *> *)configModelsWithInfos:(NSArray <BankCardInfo*>*)infos{

    if(infos.count==0){
    
        BankCardInfoModel *add = [[BankCardInfoModel alloc]init];
        add.cellClass = @"BankCardListAddCell";
        add.target = BankCardAddVC;
        add.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        WEAK_SELF(add);
        
        add.cellOperation = ^(id obj1, id obj2) {
            STRONG_SELF(add);
            
            [UIViewController tjs_pushViewController:add.target animated:YES];
        };
        
        return @[add];
    }
    
    
    NSMutableArray *models = [NSMutableArray array];
    [infos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        BankCardInfoModel *cardInfo = [[BankCardInfoModel alloc]init];
        cardInfo.cellClass = @"BankCardListDefaultCell";
        cardInfo.accessoryType = UITableViewCellAccessoryNone;
        cardInfo.bankCardInfo = (BankCardInfo *)obj;
        
        [models addObject:cardInfo];
    }];
    
    return models;
}

@end
