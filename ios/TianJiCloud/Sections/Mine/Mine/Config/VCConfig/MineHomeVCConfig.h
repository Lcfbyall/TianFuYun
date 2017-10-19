//
//  MineHomeVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerConfig.h"

#import "TJSBaseVCProtocol.h"

@class MineViewController;

@interface MineHomeVCConfig : TJSBaseControllerConfig<TJSNavigationConfig>

- (void)setup:(MineViewController *)vc;


@end
