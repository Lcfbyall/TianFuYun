//
//  AddressManageConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractVCConfig.h"

@class AddressManageController;
@interface AddressManageConfig : NSObject<ContractVCConfig>

- (void)setup:(AddressManageController *)vc;

@end
