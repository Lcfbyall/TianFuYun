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

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);



@end

