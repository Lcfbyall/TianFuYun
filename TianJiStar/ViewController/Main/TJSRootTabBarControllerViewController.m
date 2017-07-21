//
//  TJSRootTabBarControllerViewController.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSRootTabBarControllerViewController.h"
#import "TJSBaseNavigationController.h"

@interface TJSRootTabBarControllerViewController ()<UITabBarControllerDelegate>

@end

@implementation TJSRootTabBarControllerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //self.tabBar.tintColor = ThemeService.main_color_00;
    
    self.delegate = self;
    self.tabBar.translucent  = NO;
    
    //选中后的颜色,tabBarItem.setTitleTextAttributes后无效
    self.tabBar.tintColor    = [UIColor whiteColor];
    
    [self p_setupViewControllers];
    
    [self p_setupAttributeForTabBarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - viewControllers

- (void)p_setupViewControllers{
    
    
    TJSBaseNavigationController *productNC  = LOAD_Storyboard(ProductSB, ProductNC);
    productNC.tabBarItem.title              = @"产品";
    productNC.tabBarItem.image              = IMAGEOriginal(@"");
    productNC.tabBarItem.selectedImage      = IMAGEOriginal(@"");
    
    
    TJSBaseNavigationController *fileNC     = LOAD_Storyboard(FileSB, FileNC);
    fileNC.tabBarItem.title                 = @"文件";
    fileNC.tabBarItem.image                 = IMAGEOriginal(@"");
    fileNC.tabBarItem.selectedImage         = IMAGEOriginal(@"");

    TJSBaseNavigationController *mineNC     = LOAD_Storyboard(MineSB,MineNC);
    mineNC.tabBarItem.title                 = @"我的";
    mineNC.tabBarItem.image                 = IMAGEOriginal(@"");
    mineNC.tabBarItem.selectedImage         = IMAGEOriginal(@"");
    
    
    self.viewControllers = @[productNC,fileNC,mineNC];
    
}


- (void)p_setupAttributeForTabBarItem{
    
    UITabBarItem  *tabBarItem;
    if (IOS9_OR_LATER){
        
        tabBarItem   = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    }else{
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        
        tabBarItem   = [UITabBarItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        
#pragma clang diagnostic pop
        
    }
    
    [tabBarItem setTitleTextAttributes:
     @{
       NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f],
       NSForegroundColorAttributeName:[UIColor blackColor]
       } forState:UIControlStateNormal];
    
    
    [tabBarItem setTitleTextAttributes:
     @{
       NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f],
       NSForegroundColorAttributeName:[UIColor redColor]
       } forState:UIControlStateSelected];
    
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
    
    
    return YES;
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    
    
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{
    
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{
    
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed __TVOS_PROHIBITED{
    
    
}
@end
