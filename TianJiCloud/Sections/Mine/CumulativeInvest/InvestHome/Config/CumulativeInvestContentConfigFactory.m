//
//  CumulativeInvestContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestContentConfigFactory.h"
#import "CumulativeInvestDefaultContentConfig.h"

#import "CumulateInvestInfoModel.h"

@interface CumulativeInvestContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation CumulativeInvestContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
                  @"CumulateInvestDefaultCell":[CumulativeInvestDefaultContentConfig new],
        
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((CumulateInvestInfoModel *)model).cellClass];
    
    return config;
}

@end


