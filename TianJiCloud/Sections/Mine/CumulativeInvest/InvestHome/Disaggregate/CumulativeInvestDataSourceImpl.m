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

   [CumulateInvestNetworkTool requestWithParameters:nil successCallback:^(id _Nullable result) {
       
       
   } failCallback:^(id _Nullable error) {
       
       
       
   }];
    
    CumulateInvestInfo *one = [CumulateInvestInfo new];
    one.name = @"证券基金";
    one.sum = @"¥0.00万";
    CumulateInvestInfo *two = [CumulateInvestInfo new];
    two.name = @"股权基金";
    two.sum = @"¥0.00万";
    CumulateInvestInfo *three = [CumulateInvestInfo new];
    three.name = @"信托产品";
    three.sum = @"¥0.00万";
    CumulateInvestInfo *four = [CumulateInvestInfo new];
    four.name = @"债券基金";
    four.sum = @"¥0.00万";
    CumulateInvestInfo *five = [CumulateInvestInfo new];
    five.name = @"资管计划";
    five.sum = @"¥0.00万";
    NSArray *infos = @[one,two,three,four,five];
    _items = [[CumulateInvestInfoModel configWithInvestInfos:infos] mutableCopy];
    
    if(callback)callback(_items,nil);
}

- (NSArray *)items{
    
    return _items;
}


#pragma mark - Private




@end


@implementation CumulativeInvestOperateResult

@end



