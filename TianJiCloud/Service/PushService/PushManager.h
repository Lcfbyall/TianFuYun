//
//  PushManager.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PushManager : NSObject<TJSAppService>

- (instancetype _Nullable)init NS_UNAVAILABLE;

// 初始化个推sdk
- (void)startGeTuiSDK;

// 重置红点个数
- (void)resetBadge;

// 设置红点个数
- (void)setBadge:(NSInteger)badge;



@end
