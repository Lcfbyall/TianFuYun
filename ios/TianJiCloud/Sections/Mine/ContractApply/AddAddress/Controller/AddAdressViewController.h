//
//  AddAdressViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "ContractAddAddressConfigProtocol.h"
#import "ContractAddAddressConfigurateProtocol.h"

@interface AddAdressViewController : TJSBaseViewController<ContractAddAddressConfig,ContractAddAddressInteractorDelegate,TJSBaseTableViewCellDelegate>

@end
