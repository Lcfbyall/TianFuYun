//
//  HomeVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerConfig.h"

#import "TJSBaseVCProtocol.h"


@class HomeViewController;

@interface HomeVCConfig : TJSBaseControllerConfig<TJSNavigationConfig>

- (void)setup:(HomeViewController *)vc;


@end
