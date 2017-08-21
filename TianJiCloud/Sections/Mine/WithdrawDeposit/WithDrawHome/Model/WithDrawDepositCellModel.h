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


//
+ (NSArray <WithDrawDepositCellModel *> *)configModelsWithInfo:(id)info;


@end
