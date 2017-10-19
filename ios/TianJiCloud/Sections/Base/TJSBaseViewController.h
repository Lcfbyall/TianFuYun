//
//  TJSBaseViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UINavigationBar+StyleConfigure.h"
#import "TJSBaseVCProtocol.h"

@interface TJSBaseViewController : UIViewController <TJSBaseVCConfig,TJSNavigationConfig>

@property (nonatomic,copy) void(^backHandler)(id obj);

@end

FOUNDATION_EXPORT NSString * const HideNavigationBarKey;
FOUNDATION_EXPORT NSString * const NavigationBarTranslucentKey;
FOUNDATION_EXPORT NSString * const NavigationBarBarTintColor;
FOUNDATION_EXPORT NSString * const NavBarBackgroundAlpha;
FOUNDATION_EXPORT NSString * const NavigationBarBackgroundImage;
FOUNDATION_EXPORT NSString * const NavigationBarsShadowImage;
FOUNDATION_EXPORT NSString * const NavigationBarTintColor;
FOUNDATION_EXPORT NSString * const HideBackBarButtonItemKey;
FOUNDATION_EXPORT NSString * const BackBarButtonItemTintColor;
FOUNDATION_EXPORT NSString * const NavigationTitleTextAttributes;
FOUNDATION_EXPORT NSString * const AdjustsScrollViewInsets;
FOUNDATION_EXPORT NSString * const ExtendedLayoutIncludesOpaqueBars;



