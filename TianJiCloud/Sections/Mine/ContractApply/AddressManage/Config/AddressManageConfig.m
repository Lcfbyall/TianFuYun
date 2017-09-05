//
//  AddressManageConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageConfig.h"
#import "AddressManageController.h"

@interface AddressManageConfig ()

@property (nonatomic,weak)AddressManageController *vc;

@end

@implementation AddressManageConfig

- (void)setup:(AddressManageController *)vc{
  
    _vc = vc;
    
    _vc.title = @"地址管理";

}


#pragma mark - <ContractVCConfig>

- (void)applyButtonConfig:(UIButton *)btn{
    
    [btn tjs_bottomBtnStyle];
    
    btn.tjs_titleNormal = @"新增地址";
    
}


@end
