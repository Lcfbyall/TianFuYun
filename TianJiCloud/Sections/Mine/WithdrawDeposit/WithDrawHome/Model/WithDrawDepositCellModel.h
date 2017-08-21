//
//  WithDrawDepositCellModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WithDrawDepositCellModel : NSObject


@property (nonatomic,copy) NSString *cellClass;
@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;

@property (nonatomic,copy)   NSString *target;
@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);



//
+ (NSArray <WithDrawDepositCellModel *> *)configModelsWithInfo:(id)info;


@end
