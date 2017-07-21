//
//  TJSHudAlert.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSHudAlert.h"
#import "MBProgressHUD.h"

@interface TJSHudAlert ()<MBProgressHUDDelegate>

@end
@implementation TJSHudAlert


#pragma mark - 遮罩加载

+ (void)showLoadingView {
    [self showLoadingViewInView:[UIApplication sharedApplication].keyWindow withInfo:nil canTouch:NO];
}

+ (void)showLoadingViewWithInfo:(NSString *)info {
    [self showLoadingViewInView:[UIApplication sharedApplication].keyWindow withInfo:info canTouch:NO];
}

+ (void)showLoadingViewInView:(UIView *)view {
    
    [self showLoadingViewInView:view
                       withInfo:nil
                       canTouch:NO];
}

+ (void)showLoadingViewInView:(UIView *)view
                     withInfo:(NSString *)info {
    
    [self showLoadingViewInView:view
                       withInfo:info
                       canTouch:NO];
}


#pragma mark - 遮罩加载可点击

+ (void)showLoadingViewCanTouch {
    [self showLoadingViewInView:[UIApplication sharedApplication].keyWindow withInfo:nil canTouch:YES];
}

+ (void)showLoadingViewCanTouchWithInfo:(NSString *)info {
    [self showLoadingViewInView:[UIApplication sharedApplication].keyWindow withInfo:info canTouch:YES];
}

+ (void)showLoadingViewCanTouchInView:(UIView *)view {
    [self showLoadingViewInView:view withInfo:nil canTouch:YES];
}

+ (void)showLoadingViewCanTouchInView:(UIView *)view
                             withInfo:(NSString *)info {
    
    [self showLoadingViewInView:view
                       withInfo:info
                       canTouch:YES];
}

+ (void)showLoadingViewInView:(UIView *)view
                     withInfo:(NSString *)info
                     canTouch:(BOOL)canTouch {
    
    
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    progressHUD.label.numberOfLines = 0;
    progressHUD.mode = MBProgressHUDModeIndeterminate;
    
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    progressHUD.bezelView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    //progressHUD.label.textColor = ThemeService.normal_color_10;
    progressHUD.label.font = [ThemeService pingFangSCRegularWithSize:18.0];
    
    if (info) {
        progressHUD.label.text = info;
    } else {
        progressHUD.label.text = @"加载中...";
    }
    progressHUD.userInteractionEnabled = !canTouch;
    progressHUD.tag = 99999;
    progressHUD.removeFromSuperViewOnHide = YES;
}

+ (void)dimissLoadingView {
    MBProgressHUD *progressHUD = nil;
    if ([[UIApplication sharedApplication].keyWindow viewWithTag:99999]) {
        progressHUD = [[UIApplication sharedApplication].keyWindow viewWithTag:99999];
    } else {
        progressHUD = [[UIViewController tjs_currentController].view viewWithTag:99999];
    }
    [progressHUD hideAnimated:YES];
}

#pragma mark zhupeng add ,个人信息编辑资料，请求后MBProgressHUD显示成功字样，并延迟销毁
+ (void)changeInfo:(NSString *)info{
    MBProgressHUD *progressHUD = nil;
    if ([[UIApplication sharedApplication].keyWindow viewWithTag:99999]) {
        progressHUD = [[UIApplication sharedApplication].keyWindow viewWithTag:99999];
    } else {
        progressHUD = [[UIViewController tjs_currentController].view viewWithTag:99999];
    }
    
    //progressHUD.minShowTime = 1;
    
    progressHUD.label.text = info;
}
+ (void)dimissLoadingViewWithDelayTime:(NSTimeInterval)delayTime
                       completionBlock:(void(^)(void))completionBlock{
    
    MBProgressHUD *progressHUD = nil;
    if ([[UIApplication sharedApplication].keyWindow viewWithTag:99999]) {
        progressHUD = [[UIApplication sharedApplication].keyWindow viewWithTag:99999];
    } else {
        progressHUD = [[UIViewController tjs_currentController].view viewWithTag:99999];
    }
    progressHUD.completionBlock = ^{
        
        if(completionBlock)completionBlock();
    };
    [progressHUD hideAnimated:YES afterDelay:delayTime];
}

#pragma mark - 提示框

+ (void)showViewWithSuccessed:(NSString *)success {
    [self loadingViewChangeToResultView:IMAGE(@"success") withInfo:success];
}

+ (void)showViewWithFailed:(NSString *)error {
    [self loadingViewChangeToResultView:IMAGE(@"error") withInfo:error];
}

+ (void)showViewWithInfo:(NSString *)info {
    [self loadingViewChangeToResultView:nil withInfo:info];
}

+ (void)showViewWithInfo:(NSString *)info dalayTime:(NSTimeInterval)delayTime {
    [self showViewWithImage:nil withInfo:info dalayTime:delayTime];
}

+ (void)loadingViewChangeToResultView:(UIImage *)image withInfo:(NSString *)info {
    CGFloat delayTime = [self getDelayTimeWithInfo:info];
    [self showViewWithImage:image withInfo:info dalayTime:delayTime];
}

+ (void)showViewWithImage:(UIImage *)image withInfo:(NSString *)info dalayTime:(NSTimeInterval)delayTime {
    [self showViewWithImage:image withInfo:info dalayTime:delayTime view:[UIApplication sharedApplication].keyWindow];
}

+ (void)showViewWithImage:(UIImage *)image withInfo:(NSString *)info dalayTime:(NSTimeInterval)delayTime view:(UIView *)view {
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (image) {
        UIImageView *imageview = [[UIImageView alloc]initWithImage:image];
        progressHUD.customView = imageview;
        progressHUD.mode = MBProgressHUDModeCustomView;
    } else {
        progressHUD.mode = MBProgressHUDModeText;
        progressHUD.bezelView.backgroundColor = [UIColor blackColor];
        progressHUD.bezelView.layer.cornerRadius = 22;   // 设计的是全圆角
    }
    progressHUD.margin = 10;
    progressHUD.label.text = info;
    progressHUD.label.numberOfLines = 0;
    //progressHUD.label.textColor = ThemeService.origin_color_00;
    progressHUD.label.font = [ThemeService pingFangSCRegularWithSize:17.0];
    progressHUD.removeFromSuperViewOnHide = YES;
    [progressHUD hideAnimated:YES afterDelay:delayTime];
}


#pragma mark - 辅助方法
+ (CGFloat)getDelayTimeWithInfo:(NSString *)info {
    CGFloat delayTime = 1.0;
    if (info.length > 25) {
        delayTime = 2.0;
    }
    return delayTime;
}


@end
