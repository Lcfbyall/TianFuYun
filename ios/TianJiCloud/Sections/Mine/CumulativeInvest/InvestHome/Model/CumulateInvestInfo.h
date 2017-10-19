//
//  CumulateInvestInfo.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CumulateInvestInfo : NSObject

@property (nonatomic,assign) NSInteger investId;

@property (nonatomic,copy)   NSString  *name;

@property (nonatomic,copy)   NSString  *sum;

@property (nonatomic,strong) UIColor   *color;

@end


