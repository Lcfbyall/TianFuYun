//
//  MyOrderInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderInfoModel.h"
#import "NSDate+TJSInterval.h"
#import "NSMutableAttributedString+Formated.h"

static NSString *const StaticBrokerage  = @"前端佣金";
static NSString *const StaticInvestor   = @"投资人";
static NSString *const StaticInvestment = @"投资金额";
static NSString *const StaticOrderNum   = @"订单编号:";


@implementation MyOrderInfoModel

+ (NSArray <MyOrderInfoModel*>*)configWithOrderInfos:(NSArray <MyOrderInfo*>*)infos{
   
    NSMutableArray *models = [NSMutableArray array];
    [infos enumerateObjectsUsingBlock:^(MyOrderInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        MyOrderInfoModel *model = [MyOrderInfoModel new];
        NSString *orderType = obj.type;
        model.orderType = MAttWithStr(orderType).textColor(ThemeService.text_color_00).font([UIFont systemFontOfSize:12.0f]);
        NSString *orderName = obj.name;
        model.orderName = MAttWithStr(orderName).textColor(ThemeService.text_color_00).font([UIFont systemFontOfSize:16.0f]);
        NSString *orderStatus = @"预约中";//obj.status;
        model.orderStatus = MAttWithStr(orderStatus).textColor(ThemeService.main_color_01).font([UIFont systemFontOfSize:16.0f]);
        
        UIColor *normalColor = ThemeService.text_color_01;
        UIFont  *norTextFont = [UIFont systemFontOfSize:14.0f];
        UIColor *brokerageColor = ThemeService.main_color_01;
        UIFont  *borkerageFont = [UIFont systemFontOfSize:18.0f];
        UIColor *investColor = ThemeService.text_color_00;
        UIFont  *invertorFont = [UIFont systemFontOfSize:16.0f];
        
        NSString *brokerage = [NSString stringWithFormat:@"%ld\n%@(%@)",obj.brokerage,StaticBrokerage,obj.brokerageUnit];
        model.brokerage = MAttWithStr(brokerage).textColor(normalColor).font(norTextFont).formerTextColor(brokerageColor,@"\n").formerFont(borkerageFont,@"\n");
        
        NSString *investor = [NSString stringWithFormat:@"%@\n%@",obj.investor,StaticInvestor];
        model.investor = MAttWithStr(investor).textColor(normalColor).font(norTextFont).formerTextColor(investColor,@"\n").formerFont(invertorFont,@"\n");
        
        NSString *investment = [NSString stringWithFormat:@"%ld\n%@(%@)",obj.investment,StaticInvestment,obj.investmentUnit];
        model.investment = MAttWithStr(investment).textColor(normalColor).font(norTextFont).formerTextColor(investColor,@"\n").formerFont(borkerageFont,@"\n");
        
        NSString *orderNum = [NSString stringWithFormat:@"%@%@",StaticOrderNum,obj.orderNum];
        model.orderNum = MAttWithStr(orderNum).textColor(normalColor).font(norTextFont);
        
        NSString *orderTime = [NSDate tjs_dateStringWithNanoIntervalYYYY_MM_DD_HH_MM:(NSTimeInterval)obj.timestamp];
        model.orderNum = MAttWithStr(orderTime).textColor(normalColor).font(norTextFont);
        
        NSString *orderNumTime = [NSString stringWithFormat:@"%@\n%@",orderNum,orderTime];
        model.orderNumTime = MAttWithStr(orderNumTime).textColor(normalColor).font(norTextFont);
        
        [models addObject:model];
    }];

    return models;
}

@end
