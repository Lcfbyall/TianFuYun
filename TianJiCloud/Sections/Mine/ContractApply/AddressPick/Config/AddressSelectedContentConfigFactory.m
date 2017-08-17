//
//  AddressSelectedContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectedContentConfigFactory.h"
#import "AddressSelectedDefaultContentConfig.h"

#import "AddressSelectedModel.h"

@interface AddressSelectedContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation AddressSelectedContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
                  @"AddressSelectedDefaultCell":[AddressSelectedDefaultContentConfig new],
        
                  
                 };
    }
    
    return self;
}


#pragma mark - <TJSBaseCellContentConfig>

- (id<TJSBaseCellContentConfig>)configBy:(id)model{

    id<TJSBaseCellContentConfig>config = [_dict objectForKey:((AddressSelectedModel *)model).cellClass];
    
    return config;
}

@end


