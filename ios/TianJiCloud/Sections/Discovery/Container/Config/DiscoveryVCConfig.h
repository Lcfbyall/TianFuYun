//
//  DiscoveryVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseVCProtocol.h"

@class DiscoveryViewController;

@interface DiscoveryVCConfig : NSObject<TJSNavigationConfig>

- (void)setup:(DiscoveryViewController *)vc;


@end
