//
//  CumulateInvestInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CumulateInvestInfo.h"


@interface CumulateInvestInfoModel : NSObject

@property (nonatomic,strong)CumulateInvestInfo *info;

//根据情况配置
@property (nonatomic,copy)   NSString *cellClass;

@property (nonatomic,strong) UIColor  *cellBgColor;

@property (nonatomic,strong) UIColor  *cellSelectedColor;

@property (nonatomic,copy)   NSString *text;

@property (nonatomic,copy)   NSString *detailText;

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);

+ (NSArray <CumulateInvestInfoModel *> *)configWithInvestInfos:(NSArray <CumulateInvestInfo*>*)investInfos;

@end

