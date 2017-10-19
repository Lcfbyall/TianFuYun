//
//  BankCardAddContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddContentConfigFactory.h"
#import "BankCardAddDefaultContentConfig.h"

#import "BankCardAddCellInfoModel.h"

@interface BankCardAddContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation BankCardAddContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
        
                  @"BankCardAddDefaultCell":[BankCardAddDefaultContentConfig new],
        
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((BankCardAddCellInfoModel *)model).cellClass];
    
    return config;
}

@end


