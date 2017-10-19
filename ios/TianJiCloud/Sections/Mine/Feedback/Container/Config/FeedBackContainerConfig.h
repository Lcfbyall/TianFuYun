//
//  FeedBackContainerConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseVCProtocol.h"

@class FeedbackContainerController;

@interface FeedBackContainerConfig : NSObject<TJSNavigationConfig>

- (void)setup:(FeedbackContainerController *)vc;


@end
