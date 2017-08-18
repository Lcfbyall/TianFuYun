//
//  BankCardAddCellInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/18.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankCardInfo.h"

@interface BankCardAddCellInfoModel : NSObject

@property (nonatomic,strong) BankCardInfo *bankCardInfo;


@property (nonatomic,copy) NSString *cellClass;

+ (NSArray <BankCardInfo *> *)configModels;



@end
