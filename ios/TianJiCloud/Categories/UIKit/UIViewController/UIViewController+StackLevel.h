//
//  UIViewController+StackLevel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (StackLevel)

/**
 Returns the topViewController in stack of topMostController.
 */
+ (UIViewController *_Nullable)tjs_currentController;
/**
 Returns the current Top Most ViewController in hierarchy.
 */
+ (UIViewController *_Nullable)tjs_topMostController;
/**
 dismiss all to rootViewController
 */
+ (void)tjs_backToRootController;
+ (void)tjs_backToRootController:(void(^_Nullable)(void))complete;

@end
