//
//  TJSRootTabBarController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSRootTabBarController.h"
#import "TJSBaseNavigationController.h"

@interface TJSRootTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) NSArray *configArr;

@end

@implementation TJSRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //self.tabBar.tintColor = ThemeService.main_color_00;
    
    self.delegate            = self;
    self.tabBar.translucent  = NO;
    
    //选中后的颜色,tabBarItem.setTitleTextAttributes后无效
    //self.tabBar.tintColor = ;
    
    
    [self p_setupViewControllers];
    
    //[self p_setupAttributeForTabBarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - getters

- (NSArray *)configArr{
  
    if(_configArr == nil){
      
        _configArr = @[
                       
                   @{
                       @"ProductSB":HomeSB,
                       @"ProductNC":HomeNC,
                       @"title"    :NSLocalizedString(@"tab_first", @"首页"),
                       @"image"    :@"Home_Tab_nor",
                       @"selectedImage":@"Home_Tab_sel",
                       },
                       
                    
                    @{
                      @"ProductSB":ProductSB,
                      @"ProductNC":ProductNC,
                      @"title"    :NSLocalizedString(@"tab_second", @"产品"),
                      @"image"    :@"Product_Tab_nor",
                      @"selectedImage":@"Product_Tab_sel",
                    },
                   
                    @{
                      @"ProductSB":DiscoverySB,
                      @"ProductNC":DiscoveryNC,
                      @"title"    :NSLocalizedString(@"tab_third", @"发现"),
                      @"image"    :@"Discovery_Tab_nor",
                      @"selectedImage":@"Discovery_Tab_sel",
                    },
                    
                    
                    @{
                      @"ProductSB":MineSB,
                      @"ProductNC":MineNC,
                      @"title":NSLocalizedString(@"tab_fourth", @"我的"),
                      @"image":@"Mine_Tab_nor",
                      @"selectedImage":@"Mine_Tab_sel",
                    },
                
                 ];
    }

    return _configArr;
}


#pragma mark - viewControllers

- (void)p_setupViewControllers{
    
    WEAK_SELF(self);
    __block NSMutableArray *controllersArr = [NSMutableArray array];
    [self.configArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        STRONG_SELF(self);
        if(self){
            NSDictionary *configDic  = (NSDictionary *)obj;
            TJSBaseNavigationController *naviVC  = (TJSBaseNavigationController *)LOAD_Storyboard(configDic[@"ProductSB"], configDic[@"ProductNC"]);
            naviVC.tabBarItem.title              = configDic[@"title"];
            naviVC.tabBarItem.image              = IMAGEOriginal(configDic[@"image"]);
            naviVC.tabBarItem.selectedImage      = IMAGEOriginal(configDic[@"selectedImage"]);
            [controllersArr addObject:naviVC];
        }
    }];
    
    self.viewControllers = controllersArr;
}


#pragma mark - setupAttributeForTabBarItem

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
       NSFontAttributeName:[UIFont systemFontOfSize:13.0f],
       NSForegroundColorAttributeName:ThemeService.text_color_02
       } forState:UIControlStateNormal];
    
    
    [tabBarItem setTitleTextAttributes:
     @{
       NSFontAttributeName:[UIFont systemFontOfSize:13.0f],
       NSForegroundColorAttributeName:ThemeService.main_color_02
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

