//
//  ContractListConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListConfig.h"
#import "MyContractViewController.h"

@interface ContractListConfig ()

@property (nonatomic,weak)MyContractViewController *vc;

@end

@implementation ContractListConfig

- (void)setup:(MyContractViewController *)vc{
  
    _vc = vc;
    
    _vc.title = @"我的合同";

}


#pragma mark - <ContractVCConfig>

- (void)applyButtonConfig:(UIButton *)btn{
 
    [btn tjs_bottomBtnStyle];

    btn.tjs_titleNormal = @"申请合同";
    
}


@end


