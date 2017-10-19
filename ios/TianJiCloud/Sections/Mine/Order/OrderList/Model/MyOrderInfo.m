//
//  MyOrderInfo.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderInfo.h"


@implementation MyOrderInfo

+ (NSArray <MyOrderInfo *>*)defaultOrders{

    MyOrderInfo *order1 = [MyOrderInfo new];
    order1.type = @"债券基金";
    order1.name = @"投谱棚改1号私募基金";
    order1.status = 1;
    order1.brokerage = 12000;
    order1.brokerageUnit = @"元";
    order1.investment = 100;
    order1.investmentUnit = @"万";
    order1.investor = @"周亮先生";
    order1.orderNum = @"1487300410414299";
    order1.timestamp = 1504681184000;
    
    
    MyOrderInfo *order2 = [MyOrderInfo new];
    order2.type = @"证券基金";
    order2.name = @"证券基金1号私募基金";
    order2.status = 2;
    order2.brokerage = 34500;
    order2.brokerageUnit = @"元";
    order2.investment = 120;
    order2.investmentUnit = @"万";
    order2.investor = @"鸭子先生";
    order2.orderNum = @"1487387610414299";
    order2.timestamp = 1504681584000;
    
    
    MyOrderInfo *order3 = [MyOrderInfo new];
    order3.type = @"资管计划";
    order3.name = @"资管计划1号私募基金";
    order3.status = 3;
    order3.brokerage = 22000;
    order3.brokerageUnit = @"元";
    order3.investment = 210;
    order3.investmentUnit = @"万";
    order3.investor = @"二狗先生";
    order3.orderNum = @"1487452310414299";
    order3.timestamp = 1504681384000;
    
    return @[order1,order2,order3];
}

@end
