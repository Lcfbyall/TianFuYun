//
//  ProductSearchVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/26.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseVCProtocol.h"
#import "ProductSearchController.h"


@interface ProductSearchVCConfig : NSObject<TJSNavigationConfig>

- (void)setup:(ProductSearchController *)vc;



@end
