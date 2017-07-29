//
//  TJSBaseViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

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
    
    return NO;
}




#pragma mark - <UINavigationControllerDelegate>

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    BOOL isHidden = NO;
    
    if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
        [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
        [viewController respondsToSelector:@selector(tjs_hideNavigationBar)]) {
        
        isHidden = [((TJSBaseViewController *)viewController) tjs_hideNavigationBar];
    }
    
    [self.navigationController setNavigationBarHidden:isHidden animated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //NSLog(@"%@",viewController);
    
    
}

@end
