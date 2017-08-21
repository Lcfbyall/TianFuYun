//
//  WithDrawDepositConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositConfig.h"
#import "WithdrawDepositController.h"

@interface WithDrawDepositConfig ()

@property (nonatomic,weak)WithdrawDepositController *vc;

@end

@implementation WithDrawDepositConfig


- (void)setup:(WithdrawDepositController *)vc{

    _vc = vc;
    
    _vc.title = @"提现";
}

@end
