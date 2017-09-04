//
//  ContarctApplyBaseCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableViewCell.h"
#import "ContractInfoApplyModel.h"

@interface ContarctApplyBaseCell : TJSBaseTableViewCell

@property (nonatomic,strong) ContractInfoApplyModel *model;

@property (nonatomic,copy) void (^valueChangedBlock)(id sender);


@end
