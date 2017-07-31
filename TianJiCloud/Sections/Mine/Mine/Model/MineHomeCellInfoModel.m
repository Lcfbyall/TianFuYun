//
//  MineHomeCellInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeCellInfoModel.h"


@implementation MineHomeCellInfoModel

- (void)configItems{
    
    MineHomeCellInfo *balance = [MineHomeCellInfo new];
    balance.cellClass = NSClassFromString(@"MineHomeBalanceCell");
    
    MineHomeCellInfo *allOrder= [MineHomeCellInfo new];
    allOrder.cellClass= NSClassFromString(@"MineHomeDefaultCell");
    
    MineHomeCellInfo *order   = [MineHomeCellInfo new];
    order.cellClass   = NSClassFromString(@"MineHomeOrderCell");
    
    MineHomeCellInfo *invest  = [MineHomeCellInfo new];
    invest.cellClass  = NSClassFromString(@"MineHomeInvestCell");
    
    NSArray *first   = @[balance];
    NSArray *second  = @[allOrder];
    NSArray *third   = @[order];
    NSArray *fourth  = @[invest];
    NSArray *fifth   = @[
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         [MineHomeCellInfo new],
                         ];
    [fourth enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        MineHomeCellInfo *model = (MineHomeCellInfo *)obj;
        model.cellClass = NSClassFromString(@"MineHomeDefaultCell");
    }];
    
   _items =  [NSMutableArray arrayWithObjects:first,second,third,fourth,fifth, nil];
}


@end
