//
//  ContractListConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractVCConfig.h"
@class MyContractViewController;

@interface ContractListConfig : NSObject<ContractVCConfig>

- (void)setup:(MyContractViewController *)vc;


@end
