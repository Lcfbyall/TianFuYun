//
//  ProductVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerConfig.h"

#import "TJSBaseVCProtocol.h"

@class ProductListViewController;


@interface ProductListVCConfig : TJSBaseControllerConfig<TJSNavigationConfig>

- (void)setup:(ProductListViewController *)vc;

@end
