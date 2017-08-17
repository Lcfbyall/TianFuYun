//
//  AddressManageCellModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractAddressInfo.h"


@interface AddressManageCellModel : NSObject

@property (nonatomic,strong) ContractAddressInfo *address;

//根据情况配置
@property (nonatomic,copy)   NSString *cellClass;

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);


@end
