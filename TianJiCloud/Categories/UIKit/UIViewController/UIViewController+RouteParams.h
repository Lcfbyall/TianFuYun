//
//  UIViewController+RouteParams.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RouteParams)

#pragma mark - params

@property (nonatomic, strong) NSDictionary *_Nullable params;



#pragma mark - pushViewController

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                      animated:(BOOL)animated;

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                        params:(NSDictionary *_Nullable)params
                      animated:(BOOL)animated;

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                    backHandler:(void (^ _Nullable)(id _Nullable obj))backHandler
                      animated:(BOOL)animated;

+ (void)tjs_pushViewController:(NSString *_Nullable)viewController
                        params:(NSDictionary *_Nullable)params
                    backHandler:(void (^ _Nullable)(id _Nullable obj))backHandler
                      animated:(BOOL)animated;


#pragma mark - rootTabBar select

+ (void)tjs_rootTabBarToProductWithParams:(NSDictionary *_Nullable)params;

+ (void)tjs_rootTabBarToSelectedIndex:(NSUInteger)index;


@end
