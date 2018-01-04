//
//  TJSBaseViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"
#import "TJSBaseNavigationController.h"

NSString * const HideNavigationBarKey          = @"tjsHideNavigationBarKey";
NSString * const NavigationBarTranslucentKey   = @"tjsNavigationBarTranslucentKey";
NSString * const NavigationBarBarTintColor     = @"tjsNavigationBarBarTintColor";
NSString * const NavBarBackgroundAlpha         = @"tjsNavBarBackgroundAlpha";
NSString * const NavigationBarBackgroundImage  = @"tjsNavigationBarBackgroundImage";
NSString * const NavigationBarsShadowImage     = @"tjsNavigationBarsShadowImage";
NSString *const  NavigationBarTintColor        = @"tjsNavigationBarTintColor";
NSString * const HideBackBarButtonItemKey      = @"tjsHideBackBarButtonItemKey";
NSString *const  BackBarButtonItemTintColor    = @"tjsBackBarButtonItemTintColor";
NSString *const  NavigationTitleTextAttributes = @"tjsNavigationTitleTextAttributes";
NSString * const AdjustsScrollViewInsets       = @"tjsAdjustsScrollViewInsets";
NSString * const ExtendedLayoutIncludesOpaqueBars = @"tjsExtendedLayoutIncludesOpaqueBars";


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
    
    self.params = [UINavigationBar basicStyleWhite];
    [self tjs_configViewController];
    
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

- (CGFloat)tjs_navBarBackgroundAlpha{
  
    NSNumber *alpha = self.params[NavBarBackgroundAlpha];
    
    return alpha?[alpha boolValue]:1;
}

- (UIColor *)tjs_navigationBarTintColor{
    
    UIColor *mainColor = self.params[NavigationBarTintColor];
    return mainColor?:ThemeService.origin_color_01;
}

- (UIImage *)tjs_navigationBarBackgroundImage{

    UIImage *backgroundImage = self.params[NavigationBarBackgroundImage];

    return backgroundImage?:[UIImage tjs_imageWithColor:ThemeService.main_color_04];
}

- (UIImage *)tjs_navigationBarShadowImage{

    UIImage *shadowImage = self.params[NavigationBarsShadowImage];
    return shadowImage?:[UIImage new];
}

- (BOOL)tjs_hideBackBarButtonItem{

    BOOL hide = [self.params[HideBackBarButtonItemKey] boolValue];
    return hide;
}

- (NSString *)tjs_backBarButtonTitle{

    return @"";
}

- (UIImage *)tjs_backBarButtonImage{

    return IMAGE(@"back_arrow");
}

- (UIColor *)tjs_backBarButtonItemTintColor{

    UIColor *mainColor = self.params[BackBarButtonItemTintColor];
    return mainColor?:ThemeService.origin_color_01;
}

- (NSDictionary *)tjs_navigaitonBarTitleTextAttributes{
  
    NSDictionary *dic = self.params[NavigationTitleTextAttributes];
    if(!dic){
        dic = @{NSForegroundColorAttributeName:ThemeService.origin_color_01,NSFontAttributeName:[UIFont systemFontOfSize:16.0f]};
    }
    return dic;
}

- (BOOL)tjs_adjustsScrollViewInsets{
  
    BOOL adjust = [self.params[AdjustsScrollViewInsets] boolValue];
    return adjust;
}

- (BOOL)tjd_extendedLayoutIncludesOpaqueBars{

    BOOL extendedLayout = [self.params[ExtendedLayoutIncludesOpaqueBars] boolValue];
    return extendedLayout;
}

- (void)tjs_unifyPopForMoreEvent{

    if(self.backHandler)self.backHandler(self);
}


#pragma mark - Public

- (void)tjs_configViewController{
    
    //0.
    BOOL isHidden = NO;
    
    if ([self isKindOfClass:[TJSBaseViewController class]]&&
        [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
        [self respondsToSelector:@selector(tjs_hideNavigationBar)] &&
        [[self.params allKeys]containsObject:HideNavigationBarKey]) {
        
        isHidden = [((TJSBaseViewController *)self) tjs_hideNavigationBar];
        [self.navigationController setNavigationBarHidden:isHidden animated:YES];
    }
    
    if(!isHidden){
        
        //1.translucent
        BOOL translucent = NO;
        
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_translucentNavigationBar)]) {
            
            //translucent = [((TJSBaseViewController *)self) tjs_translucentNavigationBar];
            
            self.navigationController.navigationBar.translucent = translucent;
        }
        
        //2.barTintColor
        UIColor *barTintColor = nil;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_navigationBarBarTintColor)] &&
            [[self.params allKeys]containsObject:NavigationBarBarTintColor]) {
            
            barTintColor = [((TJSBaseViewController *)self) tjs_navigationBarBarTintColor];
            
            self.navigationController.navigationBar.barTintColor = barTintColor;

        }
        
        //2.1 BarBackgroundAlpha
        CGFloat alpha = 1;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_navBarBackgroundAlpha)] &&
            [[self.params allKeys]containsObject:NavBarBackgroundAlpha]) {
            
            alpha = [((TJSBaseViewController *)self) tjs_navBarBackgroundAlpha];
            self.navigationController.navigationBar.alpha = alpha;
        }
        
        
        NSArray *controllers = self.navigationController.viewControllers;
        NSInteger index = [controllers indexOfObject:self];
        if(index){
            
            //3.tintColor
            UIColor *tintColor = nil;
            if ([self isKindOfClass:[TJSBaseViewController class]]&&
                [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
                [self respondsToSelector:@selector(tjs_navigationBarTintColor)]) {
                
                tintColor = [((TJSBaseViewController *)self) tjs_navigationBarTintColor];
                self.navigationController.navigationBar.tintColor = tintColor;
            }
            
            
            //4.hideBackBarButtonItem
            BOOL hideBackBarButtonItem = NO;
            if ([self isKindOfClass:[TJSBaseViewController class]]&&
                [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
                [self respondsToSelector:@selector(tjs_hideBackBarButtonItem)]) {
                
                hideBackBarButtonItem = [((TJSBaseViewController *)self) tjs_hideBackBarButtonItem];
                
                //self.navigationController.navigationItem sethid
            }
            
            
            //5. backBarButtonItemTintColor
            UIColor *backItemColor = nil;
            if ([self isKindOfClass:[TJSBaseViewController class]]&&
                [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
                [self respondsToSelector:@selector(tjs_backBarButtonItemTintColor)]) {
                
                backItemColor = [((TJSBaseViewController *)self) tjs_backBarButtonItemTintColor];
                self.navigationController.navigationItem.leftBarButtonItem.tintColor = backItemColor;
                
                [self.navigationController.navigationItem.leftBarButtonItem setTitleTextAttributes:
  @{NSForegroundColorAttributeName:backItemColor,
            NSFontAttributeName:[UIFont systemFontOfSize:16.0f]} forState:UIControlStateNormal];
            }
        }
        
        
        //6.TitleTextAttributes
        NSDictionary * titleTextAttributes = nil;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_navigaitonBarTitleTextAttributes)]) {
            
            titleTextAttributes = [((TJSBaseViewController *)self) tjs_navigaitonBarTitleTextAttributes];
            self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        }
        
        
        //7.adjustsScrollViewInsets
        BOOL adjust = NO;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_adjustsScrollViewInsets)] && 
            [self conformsToProtocol:@protocol(TJSBaseVCConfig)] &&
            [self respondsToSelector:@selector(tjs_listView)] ) {
            
            adjust = [((TJSBaseViewController *)self) tjs_adjustsScrollViewInsets];
            adjust = NO;
            if (@available(iOS 11.0, *)) {
                if(self.tjs_listView){ 
                    self.tjs_listView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                    //self.tjs_listView.contentInset
                    //self.tjs_listView.adjustedContentInset
                }
            }else{
                self.automaticallyAdjustsScrollViewInsets= adjust;
            }
        }
        
        
        //8. BackgroundImage
        UIImage *backgroundImage = nil;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_navigationBarBackgroundImage)] &&
            [[self.params allKeys]containsObject:NavigationBarBackgroundImage]) {
            
            backgroundImage = [((TJSBaseViewController *)self) tjs_navigationBarBackgroundImage];
            [self.navigationController.navigationBar setBackgroundImage:backgroundImage
                      forBarPosition:UIBarPositionAny
                          barMetrics:UIBarMetricsDefault];
        }
        
        
        //9. ShadowImage
        UIImage *shadowImage = nil;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjs_navigationBarShadowImage)]) {
            
            shadowImage = [((TJSBaseViewController *)self) tjs_navigationBarShadowImage];
            [self.navigationController.navigationBar setShadowImage:shadowImage];
        }
        
        
        
        //10.tjd_extendedLayoutIncludesOpaqueBars
        BOOL extendedLayout = NO;;
        if ([self isKindOfClass:[TJSBaseViewController class]]&&
            [self conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [self respondsToSelector:@selector(tjd_extendedLayoutIncludesOpaqueBars)] &&
            [[self.params allKeys]containsObject:ExtendedLayoutIncludesOpaqueBars]) {
            
            extendedLayout = [((TJSBaseViewController *)self) tjd_extendedLayoutIncludesOpaqueBars];
            
            self.extendedLayoutIncludesOpaqueBars = extendedLayout;
        }
        
        //11.edgesForExtendedLayout
        
        
    }
}

@end




