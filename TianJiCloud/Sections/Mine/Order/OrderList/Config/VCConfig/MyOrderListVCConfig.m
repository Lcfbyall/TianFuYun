//
//  MyOrderListVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderListVCConfig.h"
#import "MyOrderListViewController.h"

@interface MyOrderListVCConfig ()

@property (nonatomic,weak)MyOrderListViewController *vc;

@end

@implementation MyOrderListVCConfig

- (void)setup:(MyOrderListViewController *)vc{

    _vc = vc;

   
}

@end
