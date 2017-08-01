//
//  UIViewController+RouteParams.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIViewController+RouteParams.h"
#import <objc/runtime.h>

#import "TJSBaseViewController.h"
#import "UIViewController+StackLevel.h"

@implementation UIViewController (RouteParams)

- (void)setParams:(NSDictionary *)params {
    
    objc_setAssociatedObject(self, @selector(params), params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)params {
    return objc_getAssociatedObject(self, _cmd);
}

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                      animated:(BOOL)animated{

    [self tjs_pushViewController:viewController params:nil animated:animated];
}

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                        params:(NSDictionary *_Nullable)params
                      animated:(BOOL)animated{

    [self tjs_pushViewController:viewController
                          params:params
                     backHandler:NULL
                        animated:animated];
}

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                    backHandler:(void (^ _Nullable)(id _Nullable obj))backHandler
                      animated:(BOOL)animated{
   
    [self tjs_pushViewController:viewController
                          params:nil
                      backHandler:backHandler
                        animated:animated];

}

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                        params:(NSDictionary *_Nullable)params
                    backHandler:(void (^ _Nullable)(id _Nullable obj))backHandler
                      animated:(BOOL)animated{

    TJSBaseViewController *vc = (TJSBaseViewController *)[[UIStoryboard storyboardWithName:MainSB bundle:nil] instantiateViewControllerWithIdentifier:viewController];
    
    if(params){
        
        vc.params = params;
    }
    
    if(backHandler){
      
        [((TJSBaseViewController *)vc) setBackHandler:backHandler];
    }
    
    UIViewController *currentViewController = nil;
    
    id topMost = [UIViewController tjs_topMostController];
    if([topMost isKindOfClass:[UITabBarController class]]){
       
        currentViewController = [(UITabBarController *)topMost selectedViewController];
        
        while ([currentViewController isKindOfClass:[UINavigationController class]] &&
               [(UINavigationController*)currentViewController topViewController])
        {
            
            currentViewController = [(UINavigationController*)currentViewController topViewController];
        }
        
    }else{
      
        currentViewController = [UIViewController tjs_currentController];
    }
    
    
    [[currentViewController navigationController] pushViewController:vc animated:animated];
}

@end
