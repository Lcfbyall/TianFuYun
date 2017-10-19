//
//  SocailManager.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialCore.h>
#import "SocialManagerDefine.h"


@interface SocailManager : NSObject<TJSAppService>

- (instancetype _Nullable)init NS_UNAVAILABLE;

- (void)shareToPlatform:(TJSSharePlatType)platformType
               paramDic:(NSDictionary *_Nullable)paramDic
             completion:(TJSShareResultCompletion _Nullable )completion;


@end
