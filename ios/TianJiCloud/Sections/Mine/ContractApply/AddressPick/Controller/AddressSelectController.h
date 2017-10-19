//
//  AddressSelectController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"
#import "AddressSelectedConfigProtocol.h"
#import "AddressSelectedConfigurateProtocol.h"


@interface AddressSelectController : TJSBaseViewController<AddressSelectedConfig,AddressSelectedInteractorDelegate,TJSBaseTableViewCellDelegate>

@end
