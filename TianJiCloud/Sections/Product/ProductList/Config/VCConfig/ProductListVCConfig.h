//
//  ProductVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseVCProtocol.h"

@class ProductListViewController;

@protocol ProductListVCConfig <NSObject>

- (void)onTapRightBarBtnToProductSearch:(id)sender;

@end


@interface ProductListVCConfig : NSObject<TJSNavigationConfig>

- (void)setup:(ProductListViewController *)vc;

@end
