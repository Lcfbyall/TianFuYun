//
//  AppDelegate.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/30.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
    // Do something before all other app services
    // ...
    
    

    

    
    
    // TJSAppDelegate (the super) does not implement -application:didFinishLaunchingWithOptions: actually.
    // It forwards the message to all registered services.
    // You MUST call super to ensure all registered service implementation get called.
    
    if ([super respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        
        [super application:application didFinishLaunchingWithOptions:launchOptions];
    }
    
    return YES;
}



@end
