//
//  AddressSelectedConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TJSBaseVCProtocol.h"

@class AddressSelectController;

@interface AddressSelectedConfig : NSObject<TJSNavigationConfig>

- (void)setup:(AddressSelectController *)vc;

@end
