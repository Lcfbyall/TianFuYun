//
//  SettingHomeDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeDataSourceImpl.h"

#import "CumulateInvestNetworkTool.h"

#import "CumulateInvestInfoModel.h"

@interface SettingHomeDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation SettingHomeDataSourceImpl


#pragma mark - <SettingHomeDataSource>

- (void)loadInvest:(void (^)(id, NSError *))callback{




}

- (NSArray *)items{
    
    if(_items==nil){
    
        CumulateInvestInfoModel *add = [CumulateInvestInfoModel new];
        add.cellClass = @"SettingHomeDefaultCell";
        
        CumulateInvestInfoModel *product = [CumulateInvestInfoModel new];
        product.cellClass = @"SettingHomeDefaultCell";
    
        
        _items = [NSMutableArray arrayWithObjects:add,product, nil];
    }
    
    return _items;
}


#pragma mark - Private




@end


@implementation SettingHomeOperateResult

@end



