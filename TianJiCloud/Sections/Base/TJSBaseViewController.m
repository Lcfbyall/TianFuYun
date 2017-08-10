//
//  TJSBaseViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"


NSString * const HideNavigationBarKey     = @"HideNavigationBarKey";
NSString * const NavigationBarTranslucentKey = @"NavigationBarTranslucentKey";
NSString * const NavigationBarBarTintColor = @"NavigationBarBarTintColor";
NSString *const  NavigationBarTintColor   = @"NavigationBarTintColor";
NSString * const HideBackBarButtonItemKey = @"HideBackBarButtonItemKey";

@interface TJSBaseViewController ()<UINavigationControllerDelegate>

@end


@implementation TJSBaseViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tjs_configBaseView];
    
    self.navigationController.delegate = self;
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

- (void)tjs_unifyPopForMoreEvent{

    if(self.backHandler)self.backHandler(self);
}




#pragma mark - <UINavigationControllerDelegate>

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{


    [self.navigationController.navigationBar setupStyleBasic];


    //0.
    BOOL isHidden = NO;
    
    if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
        [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
        [viewController respondsToSelector:@selector(tjs_hideNavigationBar)]) {
        
        isHidden = [((TJSBaseViewController *)viewController) tjs_hideNavigationBar];
        [self.navigationController setNavigationBarHidden:isHidden animated:YES];
        
    }


    if(!isHidden){
    
        //1.translucent
        BOOL translucent = NO;
        
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_translucentNavigationBar)]) {
            
            translucent = [((TJSBaseViewController *)viewController) tjs_translucentNavigationBar];
            self.navigationController.navigationBar.translucent = translucent;
        }

        //2.barTintColor
        UIColor *barTintColor = nil;
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_navigationBarBarTintColor)]) {
        
            barTintColor = [((TJSBaseViewController *)viewController) tjs_navigationBarBarTintColor];
            self.navigationController.navigationBar.barTintColor = barTintColor;
            
        }


        //3.tintColor
        UIColor *tintColor = nil;
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_navigationBarTintColor)]) {
            
            tintColor = [((TJSBaseViewController *)viewController) tjs_navigationBarTintColor];
            self.navigationController.navigationBar.tintColor = tintColor;
        }

    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //NSLog(@"%@",viewController);
    
    
}

@end
