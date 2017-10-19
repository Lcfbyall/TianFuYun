//
//  TJSDiscoNewsListVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerConfig.h"

#import "TJSBaseVCProtocol.h"

@class DiscoNewsListController;


@interface TJSDiscoNewsListVCConfig : TJSBaseControllerConfig<TJSNavigationConfig>

- (void)setup:(DiscoNewsListController *)vc;



@end
