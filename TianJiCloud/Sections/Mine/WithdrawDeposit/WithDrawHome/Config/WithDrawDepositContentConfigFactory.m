//
//  WithDrawDepositContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositContentConfigFactory.h"
#import "WithDrawDepositSumContentConfig.h"

#import "WithDrawDepositCellModel.h"

@interface WithDrawDepositContentConfigFactory ()

@property (nonatomic,strong) NSDictionary  *dict;

@end


@implementation WithDrawDepositContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
        
                  @"WithDrawDepositSumCell":[WithDrawDepositSumContentConfig new],
        
                  
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


