//
//  AddressManageContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageContentConfigFactory.h"
#import "AddressManageDefaultContentConfig.h"

#import "AddressManageCellModel.h"

@interface AddressManageContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation AddressManageContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
                  @"AddressManageDefaultCell":[AddressManageDefaultContentConfig new],
        
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((AddressManageCellModel *)model).cellClass];
    
    return config;
}

@end


