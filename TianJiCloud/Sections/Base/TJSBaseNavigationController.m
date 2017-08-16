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


#pragma mark - UINavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
  
    if (self.childViewControllers.count > 0) {
        
       TJSBaseViewController *nextVC = (TJSBaseViewController *)viewController;
       if([nextVC conformsToProtocol:@protocol(TJSNavigationConfig)] &&
          ![nextVC tjs_hideBackBarButtonItem]){

        WEAK_SELF(self);
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGEOriginal(@"back_arrow") style:UIBarButtonItemStylePlain handler:^(id sender) {
            
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
       
           viewController.navigationItem.leftBarButtonItem = nil;
       }
    }
    
    [super pushViewController:viewController animated:animated];
}




#pragma mark - <UINavigationControllerDelegate>

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    

    [TJSBaseNavigationController p_configViewController:viewController];

}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //NSLog(@"%@",viewController);
    
    
}


#pragma mark - Private

+ (void)p_configViewController:(UIViewController *)viewController{
    
    
    //0.
    BOOL isHidden = NO;
    
    if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
        [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
        [viewController respondsToSelector:@selector(tjs_hideNavigationBar)]) {
        
        isHidden = [((TJSBaseViewController *)viewController) tjs_hideNavigationBar];
        [viewController.navigationController setNavigationBarHidden:isHidden animated:YES];
        
    }
    
    
    if(!isHidden){
        
        //1.translucent
        BOOL translucent = NO;
        
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_translucentNavigationBar)]) {
            
            translucent = [((TJSBaseViewController *)viewController) tjs_translucentNavigationBar];
            
            viewController.navigationController.navigationBar.translucent = translucent;
        }
        
        //2.barTintColor
        UIColor *barTintColor = nil;
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_navigationBarBarTintColor)]) {
            
            barTintColor = [((TJSBaseViewController *)viewController) tjs_navigationBarBarTintColor];
            viewController.navigationController.navigationBar.barTintColor = barTintColor;
            
        }
        
        
        //3.tintColor
        UIColor *tintColor = nil;
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_navigationBarTintColor)]) {
            
            tintColor = [((TJSBaseViewController *)viewController) tjs_navigationBarTintColor];
            viewController.navigationController.navigationBar.tintColor = tintColor;
        }
        
        
        //4.hideBackBarButtonItem
        
        
        //5.adjustsScrollViewInsets
        BOOL adjust = NO;
        if ([viewController isKindOfClass:[TJSBaseViewController class]]&&
            [viewController conformsToProtocol:@protocol(TJSNavigationConfig)] &&
            [viewController respondsToSelector:@selector(tjs_adjustsScrollViewInsets)]) {
            
            viewController.automaticallyAdjustsScrollViewInsets= adjust;
        }
        
    }
}

@end
