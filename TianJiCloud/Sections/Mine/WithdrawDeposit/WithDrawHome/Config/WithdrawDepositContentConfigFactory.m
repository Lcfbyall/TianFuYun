//
//  WithdrawDepositContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithdrawDepositContentConfigFactory.h"
#import "WithdrawDepositDefaultContentConfig.h"

#import "WithDrawDepositCellModel.h"

@interface WithdrawDepositContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation WithdrawDepositContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
        
                  @"WithdrawDepositDefaultCell":[WithdrawDepositDefaultContentConfig new],
        
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((WithDrawDepositCellModel *)model).cellClass];
    
    return config;
}

@end


