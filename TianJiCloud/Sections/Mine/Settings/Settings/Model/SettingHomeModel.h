//
//  SettingHomeModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingHomeModel : NSObject

//根据情况配置
@property (nonatomic,copy)   NSString *cellClass;

@property (nonatomic,copy)   NSString *image;

@property (nonatomic,copy)   NSString *text;

@property (nonatomic,copy)   NSString *detailText;

@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;

@property (nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);

+ (NSArray <SettingHomeModel *> *)configModels;

@end
