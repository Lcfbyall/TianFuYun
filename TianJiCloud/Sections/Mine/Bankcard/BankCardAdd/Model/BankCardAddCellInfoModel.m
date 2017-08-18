//
//  BankCardAddCellInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddCellInfoModel.h"

@implementation BankCardAddCellInfoModel


- (instancetype)init{
  
    self = [super init];
    
    if(self){
        
        _title = @"";
        _titleValue = @"";
        _placeHolder = @"";
    
    }

    return self;
}

+ (NSArray <BankCardAddCellInfoModel *> *)configModelsWithInfos:(NSArray <BankCardInfo *> *)infos{

    
    NSArray *first = @[@"请输入持卡人姓名",@"请输入持卡人身份证号码"];
    NSArray *firstTitles = @[@"姓名",@"身份证"];
    NSArray *firstHeadFooters= @[@"持卡人信息",@""];
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
        model.title = [firstTitles objectAtIndex:idx];;
        model.headFooterTitles = firstHeadFooters;
        [firstModels addObject:model];
    }];
    
    NSArray *second = @[@"请选择银行",@"请输入银行卡号"];
    NSArray *secondTitles = @[@"银行",@"卡号"];
    NSArray *secondHeadFooters= @[@"请务必使用与持卡人一致的储蓄卡",@"单笔金额30万元，单日限额50万元，单月限额100万元"];
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
        model.title = [secondTitles objectAtIndex:idx];
        model.headFooterTitles = secondHeadFooters;
        [secondModels addObject:model];
    }];
    
 
    return @[firstModels,secondModels];
}

@end
