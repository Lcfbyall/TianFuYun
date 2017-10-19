//
//  WithDrawDepositCellModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankCardInfo.h"

@interface WithDrawDepositCellModel : NSObject

@property (nonatomic,strong)BankCardInfo *bankCardInfo;
@property (nonatomic,copy)  NSString *sum;
@property (nonatomic,copy)  NSString *total;

@property (nonatomic,copy) NSString *cellClass;
@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic,strong) NSArray *headerFooterTitles;

@property (nonatomic,copy)   NSString *target;
@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);
@property (nonatomic,copy) void (^itemOperation)(id obj1,id obj2);


//
+ (NSArray *)configModelsWithInfo:(id)info;


@end
