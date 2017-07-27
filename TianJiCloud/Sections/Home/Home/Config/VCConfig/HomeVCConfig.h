//
//  HomeVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseVCProtocol.h"

@class HomeViewController;


@protocol HomeVCConfig <NSObject>

- (void)onTapLeftBarBtnToMessageKindList:(id)sender;

- (void)onTapRightBarBtnToProductFilter:(id)sender;

@end


@interface HomeVCConfig : NSObject<TJSNavigationConfig>

- (void)setup:(HomeViewController *)vc;


@end
