//
//  UIApplication+TJSAppSetting.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/30.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIApplication+TJSAppSetting.h"

@implementation UIApplication (TJSAppSetting)


/*
 //跳转到系统中自己应用下面设置的时候
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
 
 
 //iOS9以前跳到系统wifi界面
 NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
 if ([[UIApplication sharedApplication] canOpenURL:url])
 {
 [[UIApplication sharedApplication] openURL:url];
 }
 //iOS10楼上方法废弃
 [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@""} completionHandler:nil ];
 
 //iOS10私有方法跳到系统wifi界面
 NSURL*url=[NSURL URLWithString:@"Prefs:root=WIFI"];
 Class LSApplicationWorkspace = NSClassFromString(@"LSApplicationWorkspace");
 [[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)] performSelector:@selector(openSensitiveURL:withOptions:) withObject:url withObject:nil];
 */


+ (void)tjs_openCamera
{
    if(IOS10_OR_LATER)
    {
        //iOS10以上系统中自己应用下面的设置
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if( [[UIApplication sharedApplication]canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@""} completionHandler:^(BOOL success) {
                
                
            }];
        }
    }
    
    // 去设置界面，开启相机访问权限
    else if (IOS8_OR_LATER)
    {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if( [[UIApplication sharedApplication]canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    else
    {
        
        NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
        if( [[UIApplication sharedApplication]canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url];
        }
        
    }
}

+ (void)tjs_openPhoto
{
    if(IOS10_OR_LATER)
    {
        //iOS10以上系统中自己应用下面的设置
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if( [[UIApplication sharedApplication]canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@""} completionHandler:^(BOOL success) {
                
                
            }];
        }
    }
    
    else if (IOS8_OR_LATER)
    {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if( [[UIApplication sharedApplication]canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    else
    {
        NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"];
        if( [[UIApplication sharedApplication]canOpenURL:url] )
        {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

@end
