//
//  UIWindow+Transition.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIWindow+Transition.h"

@implementation UIWindow (Transition)


/** useage
 
 [window setRootViewControllerWithFadeFromTop:tabBarViewController
 setComplete:^(UIViewController *newRootViewController) {
 TJSStartAdvertViewController *advertView = [[TJSStartAdvertViewController alloc] init];
 [advertView showView:newRootViewController.view];
 }];
 
 
 CATransition *transition = [CATransition animation];
 transition.type          = kCATransitionFade;
 transition.subtype       = kCATransitionFromTop;
 [keywindow setRootViewController:tabBarViewController
 setComplete:^(UIViewController *newRootViewController){
 
 TJSStartAdvertViewController *advertView = [[TJSStartAdvertViewController alloc] init];
 [advertView showView:newRootViewController.view];
 
 } transition:transition];
 **/


- (void)setRootViewControllerWithFadeFromTop:(UIViewController *)newRootViewController
                                 setComplete:(void(^)(UIViewController *newRootViewController))setComplete{
    
    CATransition *transition = [CATransition animation];
    transition.type          = kCATransitionFade;
    transition.subtype       = kCATransitionFromTop;
    
    [self setRootViewController:newRootViewController
                    setComplete:setComplete
                     transition:transition];
}


//http://stackoverflow.com/a/27153956/849645
- (void)setRootViewController:(UIViewController *)newRootViewController
                   transition:(CATransition *)transition{
    
    [self setRootViewController:newRootViewController setComplete:NULL transition:transition];
}


#pragma mark base
- (void)setRootViewController:(UIViewController *)newRootViewController
                  setComplete:(void(^)(UIViewController *newRootViewController))setComplete
                   transition:(CATransition *)transition
{
    
    
    UIViewController *previousViewController = self.rootViewController;
    
    [self.layer addAnimation:transition forKey:kCATransition];
    
    
    self.rootViewController = newRootViewController;
    if(setComplete)setComplete(newRootViewController);
    
    // Update status bar appearance using the new view controllers appearance - animate if needed
    BOOL areAnimationsEnabled = [UIView areAnimationsEnabled];
    if(areAnimationsEnabled){
        [UIView animateWithDuration:[CATransaction animationDuration] animations:^{
            
            [newRootViewController setNeedsStatusBarAppearanceUpdate];
            
        }];
    }else{
        
        [newRootViewController setNeedsStatusBarAppearanceUpdate];
    }
    
    
    // The presenting view controllers view doesn't get removed from the window as its currently transistioning and presenting a view controller
    for (UIView *subview in self.subviews) {
        
        if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            
            [subview removeFromSuperview];
        }
    }
    //add: remove empty UILayoutContainerView(s) remaining on root window
    for (UIView *subView in self.subviews)
    {
        if([subView isKindOfClass:NSClassFromString(@"UILayoutContainerView")])
        {
            if (subView.subviews.count == 0)
            {
                [subView removeFromSuperview];
            }
        }
    }
    
    
    // Allow the view controller to be deallocated
    if(previousViewController.presentedViewController){
        
        [previousViewController dismissViewControllerAnimated:NO completion:^{
            
            //add: remove old rootViewController's sub views
            for (UIView* subView in previousViewController.view.subviews)
            {
                [subView removeFromSuperview];
            }
            
            // Remove the root view in case its still showing
            [previousViewController.view removeFromSuperview];
        }];
        
    }else{
        
        //add: remove old rootViewController's sub views
        for (UIView* subView in previousViewController.view.subviews)
        {
            [subView removeFromSuperview];
        }
        
        //add: remove old rootViewController's view
        [previousViewController.view removeFromSuperview];
    }
    
}

@end


/*
 tabBarViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
 UIViewAnimationOptions animationOption = UIViewAnimationOptionTransitionCrossDissolve;
 [UIView transitionWithView:keywindow
 duration:0.5f
 options:animationOption
 animations:^{
 
 BOOL oldState = [UIView areAnimationsEnabled];
 [UIView setAnimationsEnabled:NO];
 keywindow.rootViewController = tabBarViewController;
 TJSStartAdvertViewController *advertView = [[TJSStartAdvertViewController alloc] init];
 [advertView showView:tabBarViewController.view];
 [UIView setAnimationsEnabled:oldState];
 
 
 for (UIView *subview in keywindow.subviews) {
 if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
 [subview removeFromSuperview];
 }
 }
 if(rootVC.presentedViewController){
 [rootVC dismissViewControllerAnimated:NO completion:^{
 [rootVC.view removeFromSuperview];
 }];
 }
 }
 completion:^(BOOL finished) {
 
 }];
 */

