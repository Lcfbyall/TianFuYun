//
//  BankCardAddDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddDataSourceImpl.h"
#import "BankCardAddCellInfoModel.h"

#import "BankCardAddNetworkTool.h"

@interface BankCardAddDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation BankCardAddDataSourceImpl


#pragma mark - <BankCardAddDataSource>

- (void)addBankCard:(void (^)(id, NSError *))callback{

   [BankCardAddNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
       
       
       
   } failCallback:^(id _Nullable error) {
       
       
       
   }];
    
   if(callback)callback(nil,nil);

}


- (NSArray *)items{
    
    return _items;
}

- (void)configWithBankCardInfo:(id)bankCardInfo{

    _items = [[BankCardAddCellInfoModel configModelsWithInfo:bankCardInfo] mutableCopy];

}

- (NSArray *)banks{

    NSArray *const banks = @[@"中国工商银行",
                             @"中国农业银行",
                             @"中国银行",
                             @"招商银行",
                             @"邮政储蓄银行",
                             @"浦发银行"];
    
    return banks;
}

- (void)fillingBank:(NSString *)bank{

    BankCardAddCellInfoModel *bankModel = [[_items lastObject] firstObject];

    bankModel.titleValue = bank;

}

- (NSInteger)bankIndex{
  
    BankCardAddCellInfoModel *bankModel = [[_items lastObject] firstObject];
    
    NSArray *banks = [self banks];
    
    if([banks containsObject:bankModel.titleValue]){
      
        return  [banks indexOfObject:bankModel.titleValue];
    }
    
    return 0;
}

- (BOOL)canCommit{
    
    //校验姓名、身份证、银行、卡号 输入的合法性
  
    return YES;
}

#pragma mark - Private




@end


@implementation BankCardAddOperateResult



@end



