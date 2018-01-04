//
//  ProductContainerVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/11/2.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerConfig.h"

#import "TJSBaseVCProtocol.h"

@class ProductContainerController;


@interface ProductContainerVCConfig : TJSBaseControllerConfig<TJSNavigationConfig>

- (void)setup:(ProductContainerController *)vc;

@end
