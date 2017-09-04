//
//  TJSSystemSoundService.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

//只支持30秒以内的CAF、AIF和使用PCM或IMA/ADPCM数据的WAV

@interface TJSSystemSoundService : NSObject

+ (void)playSoundWithFileName:(NSString *)fileName fileType:(NSString *)fileType;

+ (void)playSoundWithFilePath:(NSString *)filePath;

+ (void)playSoundWithFileUrl:(NSURL *)url;

+ (void)playReceiveNotification;

+ (void)playSystemShake;

@end
