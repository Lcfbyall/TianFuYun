//
//  TJSBaseViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"


NSString * const HideNavigationBarKey     = @"tjsHideNavigationBarKey";
NSString * const NavigationBarTranslucentKey = @"tjsNavigationBarTranslucentKey";
NSString * const NavigationBarBarTintColor = @"tjsNavigationBarBarTintColor";
NSString *const  NavigationBarTintColor   = @"tjsNavigationBarTintColor";
NSString * const HideBackBarButtonItemKey = @"tjsHideBackBarButtonItemKey";
NSString * const AdjustsScrollViewInsets = @"tjsAdjustsScrollViewInsets";

@interface TJSBaseViewController ()

@end


@implementation TJSBaseViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tjs_configBaseView];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
 
    [super viewWillAppear:animated];

    [self.navigationController.navigationBar setupStyleBasic];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)hidesBottomBarWhenPushed{
 
    if(self.navigationController.viewControllers.count>1){
      return YES;
    }
    return NO;
}

- (BOOL)prefersStatusBarHidden{
  
    return NO;
}




#pragma mark - <TJSBaseVCConfig>
- (void)tjs_configBaseView{


}

#pragma mark - <TJSNavigationConfig>
- (BOOL)tjs_hideNavigationBar{
    
    BOOL hide = [self.params[HideNavigationBarKey] boolValue];
    
    return hide;
}

- (BOOL)tjs_translucentNavigationBar{
  
    BOOL translucent = [self.params[NavigationBarTranslucentKey] boolValue];
    
    return translucent;
}

- (UIColor *)tjs_navigationBarBarTintColor{

    UIColor *mainColor = self.params[NavigationBarBarTintColor];
    
    return mainColor?:ThemeService.main_color_00;
}

- (UIColor *)tjs_navigationBarTintColor{
    
    UIColor *mainColor = self.params[NavigationBarTintColor];
    
    return mainColor?:ThemeService.main_color_00;
}

- (BOOL)tjs_hideBackBarButtonItem{

    BOOL hide = [self.params[HideBackBarButtonItemKey] boolValue];;
    
    return hide;
}

- (BOOL)tjs_adjustsScrollViewInsets{
  
    BOOL adjust = [self.params[AdjustsScrollViewInsets] boolValue];

    return adjust;
}

- (void)tjs_unifyPopForMoreEvent{

    if(self.backHandler)self.backHandler(self);
}

@end




