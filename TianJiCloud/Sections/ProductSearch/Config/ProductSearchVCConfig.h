//
//  ProductSearchVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerConfig.h"

#import "TJSBaseVCProtocol.h"

@class ProductSearchController;


@interface ProductSearchVCConfig : TJSBaseControllerConfig<TJSNavigationConfig>

- (void)setup:(ProductSearchController *)vc;


@end
