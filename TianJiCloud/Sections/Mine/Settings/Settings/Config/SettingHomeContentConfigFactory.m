//
//  SettingHomeContentConfigFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeContentConfigFactory.h"
#import "SettingHomeDefaultContentConfig.h"

#import "CumulateInvestInfoModel.h"

@interface SettingHomeContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;

@end


@implementation SettingHomeContentConfigFactory

- (instancetype)init
{
    if (self = [super init])
    {
        
        _dict = @{
                  
                  @"SettingDefaultTableCell":[SettingHomeDefaultContentConfig new],
        
                  
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


