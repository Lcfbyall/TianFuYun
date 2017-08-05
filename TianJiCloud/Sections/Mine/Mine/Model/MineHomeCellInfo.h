//
//  MineHomeCellInfo.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MineHomeCellItem.h"


@interface MineHomeCellInfo : NSObject

@property (nonatomic,strong) Class    cellClass;

@property (nonatomic,copy)   NSString *title;

@property (nonatomic,copy)   NSString *image;

@property (nonatomic,copy)   NSString *detailTitle;

@property (nonatomic,strong) NSArray  <MineHomeCellItem *> *cellItems;

@property (nonatomic,assign) UITableViewCellAccessoryType accessoryType;

@property (nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^cellOperation)(id obj1,id obj2);

@property (nonatomic,copy) void (^itemOperation)(id obj1,id obj2);

@end



