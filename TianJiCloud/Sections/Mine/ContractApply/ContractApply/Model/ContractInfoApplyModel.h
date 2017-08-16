//
//  ContractInfoApplyModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractInfo.h"

@interface ContractInfoApplyModel : NSObject

@property (nonatomic,strong) ContractInfo *contract;

//根据情况配置
@property (nonatomic,copy) NSString *cellClass;


@end
