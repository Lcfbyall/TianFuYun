//
//  WithDrawDepositConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WithDrawDepositController;

@interface WithDrawDepositConfig : NSObject<TJSNavigationConfig>

- (void)setup:(WithDrawDepositController *)vc;

@end
