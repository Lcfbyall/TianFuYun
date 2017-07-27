//
//  UIViewController+StackLevel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIViewController+StackLevel.h"

@implementation UIViewController (StackLevel)


#pragma mark - 最顶层的控制器－>栈顶

+ (UIViewController*)tjs_currentController;
{
    UIViewController *currentViewController = [self tjs_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
    {
        
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    }
    
    return currentViewController;
}

#pragma mark - 最顶层的控制器
+ (UIViewController*)tjs_topMostController
{
    
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topController = appRootVC;
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])
        
        topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

+ (void)tjs_backToRootController{
    
    [self tjs_backToRootController:NULL];
    
}

+ (void)tjs_backToRootController:(void(^)(void))complete
{
    
    UIViewController *currrenVC = [self tjs_currentController];
    while (currrenVC.presentingViewController) {
        
        [currrenVC dismissViewControllerAnimated:NO completion:NULL];
        
        currrenVC = currrenVC.presentingViewController;
    }
    
    //直接到root就行，tabBarVC选中哪个，导航栈就不用处理了
    
}

@end
