//
//  TJSAlertHandleUtil.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSAlertHandleUtil.h"
#import "TJSMobileCallUtil.h"
#import "UIDevice+CurrentArg.h"

@implementation TJSAlertHandleUtil

+ (void)alertHandleCallManager{
  
    NSString *title = @"联系专属服务经理";
    NSString *message = @"哥哥";
    UIColor *titleColor = [UIColor darkGrayColor];
    UIColor *messageColor=[UIColor blackColor];
    UIColor *cancelButtonColor =[UIColor darkGrayColor];
    UIColor *actionButtonColor =[UIColor brownColor];
    NSString *cancelAction = @"稍后联系";
    NSString *action= @"拨打电话";
    
    if([[UIDevice currentDevice] tjs_isSimulator]){
        
        [TJSAlertHandleUtil alertHandleWhenCallNotAvailableOnSimulator];
        return;
    }
    
    ALERT.title(title).titleColor(titleColor).message(message).messageColor(messageColor).cancelButtonColor(cancelButtonColor).actionButtonColor(actionButtonColor).cancelAction(cancelAction,^(UIAlertAction *action){
    }).action(action,^(UIAlertAction *action){
        
        [TJSMobileCallUtil callUtilToCallCustomerService];
    }).show();

}


+ (void)alertHandleWhenCallNotAvailableOnSimulator{
    
    NSString *title = @"模拟器不支持打电话";
    NSString *message= @"";
    UIColor *actionButtonColor =  UIColorFromHEX(0x007AFF);
    NSString *action = @"知道了";
    
    ALERT.title(title).message(message).actionButtonColor(actionButtonColor).action(action,NULL).show();
}


@end
