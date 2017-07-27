//
//  TJSHudAlert.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TJSHudAlert : NSObject

#pragma mark - 加载框
// window层_不可点击
+ (void)showLoadingView;
+ (void)showLoadingViewWithInfo:(NSString *)info;
// 非window层_不可点击
+ (void)showLoadingViewInView:(UIView *)view;
+ (void)showLoadingViewInView:(UIView *)view withInfo:(NSString *)info;
// 非window层_自定义是否可以点击
+ (void)showLoadingViewInView:(UIView *)view withInfo:(NSString *)info canTouch:(BOOL)canTouch;
// 去掉加载框
+ (void)dimissLoadingView;
#pragma mark zhupeng add ,个人信息编辑资料，请求后MBProgressHUD显示成功字样，并延迟销毁
+ (void)changeInfo:(NSString *)info;
+ (void)dimissLoadingViewWithDelayTime:(NSTimeInterval)delayTime
                       completionBlock:(void(^)(void))completionBlock;

#pragma mark - 提示框
// window层_可点击
+ (void)showViewWithSuccessed:(NSString *)success;
+ (void)showViewWithFailed:(NSString *)error;
+ (void)showViewWithInfo:(NSString *)info;
+ (void)showViewWithInfo:(NSString *)info dalayTime:(NSTimeInterval)delayTime;
+ (void)showViewWithImage:(UIImage *)image withInfo:(NSString *)info dalayTime:(NSTimeInterval)delayTime;

// 非window层_可点击
+ (void)showViewWithImage:(UIImage *)image withInfo:(NSString *)info dalayTime:(NSTimeInterval)delayTime view:(UIView *)view;


@end
