//
//  ProductVCConfig.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseVCProtocol.h"
#import "ProductListViewController.h"



@interface ProductListVCConfig : NSObject<TJSNavigationConfig>

- (void)setup:(ProductListViewController *)vc;

@end
