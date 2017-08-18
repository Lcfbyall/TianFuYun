//
//  BankCardInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankCardInfo.h"

@interface BankCardInfoModel : NSObject

@property (nonatomic,strong)BankCardInfo *bankCardInfo;

@property (nonatomic,copy) NSString *cellClass;

@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);


+ (NSArray <BankCardInfoModel *> *)configModelsWithInfos:(NSArray *)infos;

@end
