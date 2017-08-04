//
//  MineHomeCellItem.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineHomeCellItem : NSObject

@property (nonatomic,copy)   NSString  *title;

@property (nonatomic,copy)   NSString  *img;

@property (nonatomic,copy)   NSString *target;

@property (nonatomic,strong) NSDictionary *targetParams;

@property (nonatomic,copy) void (^itemOperation)(id obj1,id obj2);

@end
