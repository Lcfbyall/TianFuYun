//
//  BankCardListContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardListContentConfigFactory.h"
#import "BankCardListDefaultContentConfig.h"
#import "BankCardListAddContentConfig.h"

#import "BankCardInfoModel.h"

@interface BankCardListContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation BankCardListContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
                  @"BankCardListAddCell":[BankCardListAddContentConfig new],
                  @"BankCardListDefaultCell":[BankCardListDefaultContentConfig new],
        
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((BankCardInfoModel *)model).cellClass];
    
    return config;
}

@end


