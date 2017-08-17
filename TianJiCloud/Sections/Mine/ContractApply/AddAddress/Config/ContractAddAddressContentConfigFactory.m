//
//  ContractAddAddressContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressContentConfigFactory.h"

#import "ConAddressRightInputContentConfig.h"
#import "ConAddressMiddleLabelContentConfig.h"
#import "ConAddressBottomInputContentConfig.h"

#import "ContractAddAddressCellModel.h"

@interface ContractAddAddressContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation ContractAddAddressContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
        @"ConAddressRightInputCell": [ConAddressRightInputContentConfig new],
        
        @"ConAddressMiddleLabelCell":[ConAddressMiddleLabelContentConfig new],
        
        @"ConAddressBottomInputCell":[ConAddressBottomInputContentConfig new],
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((ContractAddAddressCellModel *)model).cellClass];
    
    return config;
}

@end


