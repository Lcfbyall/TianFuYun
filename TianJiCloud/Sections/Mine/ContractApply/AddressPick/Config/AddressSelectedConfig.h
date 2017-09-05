//
//  AddressSelectedConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TJSBaseVCProtocol.h"
#import "ContractVCConfig.h"

@class AddressSelectController;

@interface AddressSelectedConfig : NSObject<TJSNavigationConfig,ContractVCConfig>

- (void)setup:(AddressSelectController *)vc;

@end
