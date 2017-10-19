//
//  TJSImagePicker.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJSImagePicker : NSObject


#pragma mark 弹出相机
+ (void)presentCameraCompletionHandler:(void(^)(UIImage *pikingImage))complete;

#pragma mark 弹出图库
+ (void)presentPhotoLibraryCompletionHandler:(void(^)(UIImage *pikingImage))complete;

#pragma mark 弹出相册
+ (void)presentPhotoAlbumCompletionHandler:(void(^)(UIImage *pikingImage))complete;

@end
