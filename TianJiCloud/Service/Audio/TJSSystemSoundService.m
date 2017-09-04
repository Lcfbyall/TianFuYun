//
//  TJSSystemSoundService.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSSystemSoundService.h"
#import <AudioToolbox/AudioServices.h>

@implementation TJSSystemSoundService


+ (void)playSoundWithFileName:(NSString *)fileName
                     fileType:(NSString *)fileType{
    
    if (fileName.length == 0) {
        return;
    }
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    [TJSSystemSoundService playSoundWithFilePath:soundFilePath];
}

+ (void)playSoundWithFilePath:(NSString *)filePath {
    
    if (filePath.length == 0) {
        return;
    }
    NSURL *url = [NSURL fileURLWithPath:filePath];
    [TJSSystemSoundService playSoundWithFileUrl:url];
}

+ (void)playSoundWithFileUrl:(NSURL *)url {
    
    if (!url) {
        return;
    }
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlayAlertSound(soundID);
}

+ (void)playReceiveNotification {
    
    AudioServicesPlaySystemSound(1003);
}

+ (void)playSystemShake {
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
