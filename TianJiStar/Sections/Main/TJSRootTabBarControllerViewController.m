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

@property (nonatomic,strong) NSArray *configArr;

@end

@implementation TJSRootTabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //self.tabBar.tintColor = ThemeService.main_color_00;
    
    self.delegate            = self;
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


#pragma mark - getters

- (NSArray *)configArr{
  
    if(_configArr == nil){
      
        _configArr = @[
                    
                    @{
                      @"ProductSB":ProductSB,
                      @"ProductNC":ProductNC,
                      @"title"    :@"产品",
                      @"image"    :@"bottomBar-chanpin-nor",
                      @"selectedImage":@"bottomBar-chanpin-sel",
                    },
                    
                    @{
                      @"ProductSB":FileSB,
                      @"ProductNC":FileNC,
                      @"title"    :@"文件",
                      @"image"    :@"bottomBar-wenjian-nor",
                      @"selectedImage":@"bottomBar-wenjian-sel",
                    },
                    
                    
                    @{
                      @"ProductSB":MineSB,
                      @"ProductNC":MineNC,
                      @"title":@"我的",
                      @"image":@"bottomBar-wode-nor",
                      @"selectedImage":@"bottomBar-wode-sel",
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
            
            TJSBaseNavigationController *naviVC  = LOAD_Storyboard(configDic[@"ProductSB"], configDic[@"ProductNC"]);
            naviVC.tabBarItem.title              = configDic[@"title"];
            naviVC.tabBarItem.image              = IMAGEOriginal(configDic[@"image"]);
            naviVC.tabBarItem.selectedImage      = IMAGEOriginal(configDic[@"selectedImage"]);
            
            [controllersArr addObject:naviVC];
        }
        
    }];
    
    self.viewControllers = controllersArr;
    
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
       NSFontAttributeName:[UIFont systemFontOfSize:13.0f],
       NSForegroundColorAttributeName:[UIColor blackColor]
       } forState:UIControlStateNormal];
    
    
    [tabBarItem setTitleTextAttributes:
     @{
       NSFontAttributeName:[UIFont systemFontOfSize:13.0f],
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
