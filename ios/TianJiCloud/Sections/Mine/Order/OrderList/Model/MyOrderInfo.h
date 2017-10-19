//
//  MyOrderInfo.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TJSProductInfo.h"

@interface MyOrderInfo : NSObject

@property (nonatomic,strong) TJSProductInfo *product;

@property (nonatomic,copy)   NSString  *type;

@property (nonatomic,copy)   NSString  *name;

@property (nonatomic,assign) NSInteger status;

@property (nonatomic,assign) NSInteger brokerage;

@property (nonatomic,copy)   NSString  *brokerageUnit;

@property (nonatomic,assign) NSInteger investment;

@property (nonatomic,copy)   NSString  *investmentUnit;

@property (nonatomic,copy)   NSString  *investor;
//毫秒
@property (nonatomic,copy)   NSString  *orderNum;

@property (nonatomic,assign) long long timestamp;

+ (NSArray <MyOrderInfo *>*)defaultOrders;

@end
