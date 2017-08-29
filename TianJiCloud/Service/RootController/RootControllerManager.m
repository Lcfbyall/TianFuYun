//
//  RootControllerManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "RootControllerManager.h"

@implementation RootControllerManager

+ (instancetype)sharedManager {
    
    static RootControllerManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

#pragma mark - <TJSAppService>

TJS_EXPORT_SERVICE(@"RootController")


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TJSAppDelegate *appdelegate = (TJSAppDelegate *)[UIApplication sharedApplication].delegate;
    
    appdelegate.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    appdelegate.window.rootViewController = LOAD_Storyboard(MainSB,MainTabBar);
    [appdelegate.window makeKeyAndVisible];
    
    return YES;
}

@end
