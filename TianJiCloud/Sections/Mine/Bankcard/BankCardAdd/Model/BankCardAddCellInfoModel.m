//
//  BankCardAddCellInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddCellInfoModel.h"

@implementation BankCardAddCellInfoModel

+ (NSArray <BankCardAddCellInfoModel *> *)configModelsWithInfos:(NSArray <BankCardInfo *> *)infos{

    
    NSArray *first = @[@"请输入持卡人姓名",@"请输入持卡人身份证号码"];
    NSMutableArray *firstModels = [NSMutableArray array];
    [first enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        BankCardAddCellInfoModel *model = [BankCardAddCellInfoModel new];
        if(!infos.count){
            BankCardInfo *info = [BankCardInfo new];
            model.bankCardInfo = info;
        }
        model.cellClass = @"BankCardAddDefaaultCell";
        model.canInput = YES;
        model.accessoryType = UITableViewCellAccessoryNone;
        model.selectionStyle = UITableViewCellSelectionStyleNone;
        model.placeHolder = [first objectAtIndex:idx];
        [firstModels addObject:model];
    }];
    
    NSArray *second = @[@"请选择银行",@"请输入银行卡号"];
    NSMutableArray *secondModels = [NSMutableArray array];
    [second enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        BankCardAddCellInfoModel *model = [BankCardAddCellInfoModel new];
        if(!infos.count){
            BankCardInfo *info = [BankCardInfo new];
            model.bankCardInfo = info;
        }
        model.cellClass = @"BankCardAddDefaaultCell";
        model.canInput = !idx? NO:YES;
        model.accessoryType = !idx?UITableViewCellAccessoryDisclosureIndicator: UITableViewCellAccessoryNone;
        model.selectionStyle = UITableViewCellSelectionStyleNone;
        model.placeHolder = [first objectAtIndex:idx];
        [secondModels addObject:model];
    }];
    
 
    return @[firstModels,secondModels];
}

@end
