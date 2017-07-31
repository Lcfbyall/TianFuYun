//
//  TJSMineHomeDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeDataSourceImpl.h"

#import "MineHomeCellInfoModel.h"

@interface TJSMineHomeDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@end


@implementation TJSMineHomeDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
    }
    
    return self;
}


#pragma mark - <TJSMineHomeDataSource>

- (NSArray *)items{
    
    MineHomeCellInfoModel *balance = [MineHomeCellInfoModel new];
    balance.cellClass = NSClassFromString(@"MineHomeBalanceCell");
    MineHomeCellInfoModel *order = [MineHomeCellInfoModel new];
    order.cellClass = NSClassFromString(@"MineHomeOrderCell");
    MineHomeCellInfoModel *invest = [MineHomeCellInfoModel new];
    invest.cellClass = NSClassFromString(@"MineHomeInvestCell");
    NSArray *first  = @[balance];
    NSArray *second = @[order];
    NSArray *third  = @[invest];
    NSArray *fourth = @[
                        [MineHomeCellInfoModel new],
                        [MineHomeCellInfoModel new],
                        [MineHomeCellInfoModel new],
                        [MineHomeCellInfoModel new],
                        [MineHomeCellInfoModel new],
                        [MineHomeCellInfoModel new],
                        [MineHomeCellInfoModel new],
                      ];
    [fourth enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MineHomeCellInfoModel *model = (MineHomeCellInfoModel *)obj;
        model.cellClass = NSClassFromString(@"MineHomeDefaultCell");
    }];
    return [NSArray arrayWithObjects:first,second,third,fourth, nil];
}


@end
