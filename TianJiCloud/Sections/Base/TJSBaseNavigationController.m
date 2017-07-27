//
//  TJSBaseNavigationController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseNavigationController.h"
#import "TJSBaseViewController.h"
#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@interface TJSBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation TJSBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - UINavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
  
    if (self.childViewControllers.count > 0) {
        
        WEAK_SELF(self);
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(@"header-back") style:UIBarButtonItemStylePlain handler:^(id sender) {
            
            STRONG_SELF(self);
            TJSBaseViewController *vc = [self.viewControllers lastObject];
            
            if([vc conformsToProtocol:@protocol(TJSNavigationConfig)] &&
               [vc respondsToSelector:@selector(tjs_unifyPopForMoreEvent)]
               ){
            
                [vc tjs_unifyPopForMoreEvent];
                
            }else{
                [vc.navigationController popViewControllerAnimated:YES];
            }
        }];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    
    [super pushViewController:viewController animated:animated];
}



@end
