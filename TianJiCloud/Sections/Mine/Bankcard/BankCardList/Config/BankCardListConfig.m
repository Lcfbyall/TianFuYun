//
//  BankCardListConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardListConfig.h"
#import "BackCardManagerController.h"

@interface BankCardListConfig ()

@property (nonatomic,weak)BackCardManagerController *vc;

@end

@implementation BankCardListConfig

- (void)setup:(BackCardManagerController *)vc{
  
    _vc = vc;
    
    _vc.title = @"我的银行卡";

}




@end
