//
//  MyOrderInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyOrderInfo.h"

@interface MyOrderInfoModel : NSObject

@property (nonatomic,strong) MyOrderInfo *order;
@property (nonatomic,copy) NSAttributedString *orderType;
@property (nonatomic,copy) NSAttributedString *orderName;
@property (nonatomic,copy) NSAttributedString *orderStatus;
@property (nonatomic,copy) NSAttributedString *brokerage;
@property (nonatomic,copy) NSAttributedString *investor;
@property (nonatomic,copy) NSAttributedString *investment;
@property (nonatomic,copy) NSAttributedString *orderNum;
@property (nonatomic,copy) NSAttributedString *orderTime;
@property (nonatomic,copy) NSAttributedString *orderNumTime;

+ (NSArray <MyOrderInfoModel*>*)configWithOrderInfos:(NSArray <MyOrderInfo*>*)infos;

@end
