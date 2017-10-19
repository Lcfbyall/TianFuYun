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
    
    [self setNavBarAppearence];
    
    [appdelegate.window makeKeyAndVisible];
    
    return YES;
}


- (void)setNavBarAppearence
{
    // 设置导航栏默认的背景颜色
    [UIColor wr_setDefaultNavBarBarTintColor:ThemeService.main_color_00];
    // 设置导航栏所有按钮的默认颜色
    [UIColor wr_setDefaultNavBarTintColor:ThemeService.origin_color_01];
    // 设置导航栏标题默认颜色
    [UIColor wr_setDefaultNavBarTitleColor:ThemeService.origin_color_01];
    // 统一设置状态栏样式
    [UIColor wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [UIColor wr_setDefaultNavBarShadowImageHidden:YES];
}

@end
