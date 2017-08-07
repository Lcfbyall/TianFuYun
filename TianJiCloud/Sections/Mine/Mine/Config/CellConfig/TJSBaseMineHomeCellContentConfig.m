//
//  TJSBaseMineHomeCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseMineHomeCellContentConfig.h"

#import "MineHomeCellInfoModel.h"
#import "TJSMineHomeBalanceCellContentConfig.h"
#import "TJSMineHomeOrderCellContentConfig.h"
#import "TJSMineHomeInvestCellContentConfig.h"
#import "TJSMineHomeDefaultCellContentConfig.h"


@interface TJSMineHomeCellContentConfigFactory ()

@property (nonatomic,strong)    NSDictionary  *dict;


@end

@implementation TJSMineHomeCellContentConfigFactory


+ (instancetype)sharedFacotry
{
    static TJSMineHomeCellContentConfigFactory *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[TJSMineHomeCellContentConfigFactory alloc] init];
    });
    return instance;
}


- (instancetype)init
{
    if (self = [super init])
    {
        
        //放入不同种类的内容
        _dict = @{
                  
                  @"MineHomeBalanceCell":[TJSMineHomeBalanceCellContentConfig new],
                  @"MineHomeOrderCell":[TJSMineHomeOrderCellContentConfig new],
                  @"MineHomeInvestCell":[TJSMineHomeInvestCellContentConfig new],
                  @"MineHomeDefaultCell":[TJSMineHomeDefaultCellContentConfig new],
                  
                  
                 };
    }
    
    return self;
}


- (id<TJSMineHomeCellContentConfig>)configBy:(id)model
{
    if([model isKindOfClass:[MineHomeCellInfo class]]){
      
        MineHomeCellInfo *cellModel = (MineHomeCellInfo *)model;
        NSString *cellClass = NSStringFromClass(cellModel.cellClass);
       id<TJSMineHomeCellContentConfig>config = [_dict objectForKey:cellClass];
    
        return config;
    }
    
    return nil;
}



@end
