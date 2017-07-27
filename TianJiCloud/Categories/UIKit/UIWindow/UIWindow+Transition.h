//
//  UIWindow+Transition.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Transition)

- (void)setRootViewControllerWithFadeFromTop:(UIViewController *)newRootViewController
                                 setComplete:(void(^)(UIViewController *newRootViewController))setComplete;

- (void)setRootViewController:(UIViewController *)newRootViewController
                   transition:(CATransition *)transition;

- (void)setRootViewController:(UIViewController *)newRootViewController
                  setComplete:(void(^)(UIViewController *newRootViewController))setComplete
                   transition:(CATransition *)transition;
@end
