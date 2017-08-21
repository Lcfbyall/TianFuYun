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
        
        _placeHolder = @"";
    
    }

    return self;
}

+ (NSArray <BankCardAddCellInfoModel *> *)configModelsWithInfo:(BankCardInfo *)info{

    
    NSArray *firstPlaceHolder = @[@"请输入持卡人姓名",@"请输入持卡人身份证号码"];
    NSArray *firstTitles = @[@"姓名",@"身份证"];
    NSArray *firstHeadFooters= @[@"持卡人信息",@""];
    NSMutableArray *firstModels = [NSMutableArray array];
    [firstPlaceHolder enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        BankCardAddCellInfoModel *model = [BankCardAddCellInfoModel new];
        if(!info){
            BankCardInfo *info = [BankCardInfo new];
            model.bankCardInfo = info;
        }
        model.cellClass = @"BankCardAddDefaultCell";
        model.canInput = YES;
        model.accessoryType = UITableViewCellAccessoryNone;
        model.selectionStyle = UITableViewCellSelectionStyleNone;
        model.keyboardType = !idx?UIKeyboardTypeDefault:UIKeyboardTypeASCIICapable;
        model.bankCardTitle = !idx?@"name":@"IDCard";
        
        model.placeHolder = [firstPlaceHolder objectAtIndex:idx];
        model.title = [firstTitles objectAtIndex:idx];;
        model.headFooterTitles = firstHeadFooters;
        [firstModels addObject:model];
    }];
    
    NSArray *secondPlaceHolder = @[@"请选择银行",@"请输入银行卡号"];
    NSArray *secondTitles = @[@"银行",@"卡号"];
    NSArray *secondHeadFooters= @[@"请务必使用与持卡人一致的储蓄卡",@"单笔金额30万元，单日限额50万元，单月限额100万元"];
    NSMutableArray *secondModels = [NSMutableArray array];
    [secondPlaceHolder enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        BankCardAddCellInfoModel *model = [BankCardAddCellInfoModel new];
        if(!info){
            BankCardInfo *info = [BankCardInfo new];
            model.bankCardInfo = info;
        }
        model.cellClass = @"BankCardAddDefaultCell";
        model.canInput = !idx? NO:YES;
        model.accessoryType = !idx?UITableViewCellAccessoryDisclosureIndicator: UITableViewCellAccessoryNone;
        model.selectionStyle = !idx?UITableViewCellSelectionStyleDefault:UITableViewCellSelectionStyleNone;
        model.keyboardType = !idx?UIKeyboardTypeDefault:UIKeyboardTypeNumberPad;
        model.bankCardTitle = !idx?@"bank":@"bankNumber";
        
        model.placeHolder = [secondPlaceHolder objectAtIndex:idx];
        model.title = [secondTitles objectAtIndex:idx];
        model.headFooterTitles = secondHeadFooters;
        [secondModels addObject:model];
    }];
    
 
    return @[firstModels,secondModels];
}


#pragma mark - getters

- (void)setTitleValue:(NSString *)titleValue{
  
    [self.bankCardInfo setValue:titleValue forKey:self.bankCardTitle];
}

- (NSString *)titleValue{
 
    return [self.bankCardInfo valueForKey:self.bankCardTitle];
}

@end
