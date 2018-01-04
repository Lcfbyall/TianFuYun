//
//  TJSBaseNavigationController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseNavigationController.h"
#import "TJSBaseViewController.h"

@interface TJSBaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation TJSBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

//push -> viewDidLoad -> viewWillAppear -> willShowViewController

#pragma mark - UINavigationController

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated{
  
    if (self.childViewControllers.count > 0) {
        
       TJSBaseViewController *nextVC = (TJSBaseViewController *)viewController;
       if([nextVC conformsToProtocol:@protocol(TJSNavigationConfig)] &&
          ![nextVC tjs_hideBackBarButtonItem]){

        WEAK_SELF(self);
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(@"back_arrow") style:UIBarButtonItemStylePlain handler:^(id sender) {
            
            STRONG_SELF(self);
            TJSBaseViewController *vc = [self.viewControllers lastObject];
            
            if([vc conformsToProtocol:@protocol(TJSNavigationConfig)] &&
               [vc respondsToSelector:@selector(tjs_unifyPopForMoreEvent)]
               && vc.backHandler){
            
                [vc tjs_unifyPopForMoreEvent];
                
            }else{
                
                [vc.navigationController popViewControllerAnimated:YES];
            }
        }];
           
        viewController.navigationItem.leftBarButtonItem = leftItem;

       }else{
       
           UIBarButtonItem *left = [[UIBarButtonItem alloc]bk_initWithTitle:@"隐藏" style:UIBarButtonItemStylePlain handler:^(id sender) {
           }];

          [left setTitleTextAttributes:@{NSForegroundColorAttributeName:ThemeService.origin_color_01,NSFontAttributeName :[UIFont systemFontOfSize:16.0]} forState:UIControlStateNormal];
           //[left setTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
           //[left setBackgroundVerticalPositionAdjustment:60 forBarMetrics:UIBarMetricsDefault];

           /*
           //
           UIImage *backButtonImage = [UIImage new];
           [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
                                                             forState:UIControlStateNormal
                                                           barMetrics:UIBarMetricsDefault];
           //iOS 11 中setBackButtonTitlePositionAdjustment:UIOffsetMake没法把按钮移出navigation bar。
           //解决方法是设置navigationController的backIndicatorImage和backIndicatorTransitionMaskImage
           [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
           self.navigationBar.backIndicatorImage = backButtonImage;
           self.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
           */
           /*
           UIView *leftV = [[UIView alloc]init];
           leftV.frame = CGRectMake(0, 0, 10, 10);
           leftV.backgroundColor = [UIColor redColor];
           left = [[UIBarButtonItem alloc]initWithCustomView:leftV];
           */
           viewController.navigationItem.leftBarButtonItem = left;
       }
    }
    
    [super pushViewController:viewController animated:animated];
}


#pragma mark - <UINavigationControllerDelegate>

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
// 侧滑一点，会调用，放开没有返回还在本界面，但界面设置已经是上一个的了
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
 
    
    
}

@end
