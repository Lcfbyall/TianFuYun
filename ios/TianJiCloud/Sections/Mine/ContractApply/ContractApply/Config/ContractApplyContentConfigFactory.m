//
//  ContractApplyContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyContentConfigFactory.h"

#import "ContractApplyAddAddressContentConfig.h"
#import "ContractApplyInfoContentConfig.h"
#import "ContractApplyPNameContentConfig.h"
#import "ContractApplyPResultContentConfig.h"

#import "ContractInfoApplyModel.h"

@interface ContractApplyContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation ContractApplyContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
                  @"ContractApplyAddAddressCell": [ContractApplyAddAddressContentConfig new],
                  @"ContractApplyInfoCell": [ContractApplyInfoContentConfig new],
                  @"ContractApplyProductNameCell": [ContractApplyPNameContentConfig new],
                  @"ContractApplyProductResultCell": [ContractApplyPResultContentConfig new]
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((ContractInfoApplyModel *)model).cellClass];
    
    return config;
}

@end


