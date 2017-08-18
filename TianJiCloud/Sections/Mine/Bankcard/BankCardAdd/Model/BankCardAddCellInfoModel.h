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
@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;

//
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *placeHolder;
@property (nonatomic,copy) NSString *titleValue;
@property (nonatomic,assign) BOOL canInput;
@property (nonatomic,strong) NSArray *headFooterTitles;


//
+ (NSArray <BankCardAddCellInfoModel *> *)configModelsWithInfos:(NSArray <BankCardInfo *> *)infos;


@end
