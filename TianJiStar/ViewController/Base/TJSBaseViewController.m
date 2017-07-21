//
//  TJSBaseViewController.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

@interface TJSBaseViewController ()<UINavigationControllerDelegate>

@end

@implementation TJSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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


#pragma mark - TJSViewControllerHideNavigationBarDelegate
- (BOOL)tjs_hideNavigationBar{
    
    return NO;
}


#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    BOOL isHidden = NO;
    
    if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
        [viewController conformsToProtocol:@protocol(TJSViewControllerHideNavigationBarDelegate)] &&
        [viewController respondsToSelector:@selector(tjs_hideNavigationBar)]) {
        
        isHidden = [((TJSBaseViewController *)viewController) tjs_hideNavigationBar];
    }
    
    [self.navigationController setNavigationBarHidden:isHidden animated:YES];
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSLog(@"%@",viewController);
    
    
}

@end
