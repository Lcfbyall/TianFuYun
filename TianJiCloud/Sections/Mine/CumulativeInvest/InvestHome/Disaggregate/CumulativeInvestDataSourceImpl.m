//
//  CumulativeInvestDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestDataSourceImpl.h"

#import "CumulateInvestNetworkTool.h"

#import "CumulateInvestInfoModel.h"

@interface CumulativeInvestDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation CumulativeInvestDataSourceImpl


#pragma mark - <CumulativeInvestDataSource>

- (void)loadInvest:(void (^)(id, NSError *))callback{




}

- (NSArray *)items{
    
    if(_items==nil){
    
        CumulateInvestInfoModel *add = [CumulateInvestInfoModel new];
        add.cellClass = @"CumulativeInvestDefaultCell";
        
        CumulateInvestInfoModel *product = [CumulateInvestInfoModel new];
        product.cellClass = @"CumulativeInvestDefaultCell";
    
        
        _items = [NSMutableArray arrayWithObjects:add,product, nil];
    }
    
    return _items;
}


#pragma mark - Private




@end


@implementation CumulativeInvestOperateResult

@end



