//
//  MineViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import "TJSMineHomeVCProtocol.h"
#import "TJSMineHomeConfigurateProtocol.h"
#import "TJSMineHomeCellProtocol.h"


@interface MineViewController : TJSBaseViewController<MineHomeVCConfig,TJSMineHomeInteractorDelegate,TJSMineHomeCellDelegate>

@end
