//
//  WithDrawDepositConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositConfig.h"
#import "WithDrawDepositController.h"

@interface WithDrawDepositConfig ()

@property (nonatomic,weak)WithDrawDepositController *vc;

@end

@implementation WithDrawDepositConfig


- (void)setup:(WithDrawDepositController *)vc{

    _vc = vc;
    
    _vc.title = @"佣金提现";
}

@end
