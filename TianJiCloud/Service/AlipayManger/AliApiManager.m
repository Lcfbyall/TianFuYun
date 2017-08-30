//
//  AliApiManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/30.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AliApiManager.h"

@implementation AliApiManager

+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AliApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[AliApiManager alloc] init];
    });
    return instance;
}


#pragma mark - <TJSAppService>

TJS_EXPORT_SERVICE(@"AliApiService")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url {
    
    return  YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    return YES;
}

@end
