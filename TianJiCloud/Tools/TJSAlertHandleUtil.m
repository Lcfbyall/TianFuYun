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

//actionSheet
#import "TJSActionSheet.h"
#import "TJSImagePicker.h"

@implementation TJSAlertHandleUtil

+ (void)alertHandleWhenNetNotReachable {
    
    ALERT.title(@"出错啦!").message(@"当前无网络连接,请检查您的网络环境").action(@"确定",^(UIAlertAction *action){
        
        
    }).show();
    
}

+ (void)alertHandleCallManager{
  
    NSString *title = @"联系专属服务经理";
    NSString *message = @"哥哥";
    UIColor *titleColor = [UIColor darkGrayColor];
    UIColor *messageColor = [UIColor blackColor];
    UIColor *cancelButtonColor = [UIColor darkGrayColor];
    UIColor *actionButtonColor = [UIColor brownColor];
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



+ (void)actionSheetHandleWhenUploadProfileIcon:(void (^)(id))block{

    //UIAlertController can only have one action with a style of UIAlertActionStyleCancel
    ACTION_SHEET.action(@"从手机相册中选择",^(UIAlertAction *action){
        
        [TJSImagePicker presentPhotoLibraryCompletionHandler:^(UIImage *pikingImage) {
            
            if(block)block(pikingImage);
        }];
        
    }).action(@"拍照",^(UIAlertAction *action){
        
        [TJSImagePicker presentCameraCompletionHandler:^(UIImage *pikingImage) {
            
            if(block)block(pikingImage);
        }];
        
    }).cancelAction(@"取消",^(UIAlertAction *action){
        
        NSLog(@"取消了");
        
    }).actionButtonColor(ThemeService.text_color_01).cancelButtonColor([UIColor redColor]).show();
}


@end


