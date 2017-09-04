//
//  ContractAddAddressBaseCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableViewCell.h"
#import "ContractAddAddressCellModel.h"


@interface ContractAddAddressBaseCell : TJSBaseTableViewCell

@property (nonatomic,strong) ContractAddAddressCellModel *model;

@property (nonatomic,copy) void (^valueChangedBlock)(id sender);


@end
