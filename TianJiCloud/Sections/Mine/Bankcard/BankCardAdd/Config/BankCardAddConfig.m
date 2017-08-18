//
//  BankCardAddConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddConfig.h"
#import "BankCardAddViewController.h"

@interface BankCardAddConfig ()

@property (nonatomic,weak)BankCardAddViewController *vc;

@end

@implementation BankCardAddConfig

- (void)setup:(BankCardAddViewController *)vc{
  
    _vc = vc;
    
    _vc.title = @"添加银行卡";

}




@end
