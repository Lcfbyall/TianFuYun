//
//  ContractAddAddressCellModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractAddressInfo.h"


@interface ContractAddAddressCellModel : NSObject

@property (nonatomic,strong) ContractAddressInfo *address;

//根据情况配置
@property (nonatomic,copy)   NSString *cellClass;
@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);

@property (nonatomic,copy)   NSString *leftImage;
@property (nonatomic,copy)   NSString *leftValue;
@property (nonatomic,strong) UIColor  *leftValueColor;
@property (nonatomic,strong) UIColor  *rightPlaceColor;
@property (nonatomic,strong) UIColor  *rightValueColor;
@property (nonatomic,copy)   NSString *rightPlaceHolder;
@property (nonatomic,copy)   NSString *rightValue;
@property (nonatomic,strong) UIFont   *leftValueFont;
@property (nonatomic,strong) UIFont   *rightValueFont;

+ (NSArray <ContractAddAddressCellModel *> *)configModelsWithAddress:(ContractAddressInfo *)addressInfo;


@end
