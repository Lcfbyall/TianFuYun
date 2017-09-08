//
//  TJSImagePicker.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSImagePicker.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <Photos/PHPhotoLibrary.h>

#import "TJSHudAlert.h"
#import "UIDevice+CurrentArg.h"


static NSString *const TJMPhotoRequestLoading = @"请稍后";
static NSString *const TJMIPhoneSimulator     = @"模拟器中无法打开照相机,请在真机中使用";
static NSString *const TJMDeviceNotAvailable  = @"设备不支持";
static NSString *const TJMCameraUnuseful      = @"无法使用相机";
static NSString *const TJMPleaseSettingCamera = @"请在iPhone的""设置-隐私-相机""中允许访问相机";
static NSString *const TJMCameraSure          = @"确定";
static NSString *const TJMPhotoUnuseful       = @"无法打开相册";
static NSString *const TJMPleaseSettingPhoto  = @"请在iPhone的""设置-隐私-照片""中允许访问相册";
static NSString *const TJMPhotoSure           = @"确定";


static  TJSImagePicker *imagePikerSevice;

@interface TJSImagePicker ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,strong)UIImagePickerController *imagePickerController;
@property(nonatomic,copy) void (^completionHandler)(UIImage *pikingImage);

@end

@implementation TJSImagePicker

#pragma mark 弹出相机
+ (void)presentCameraCompletionHandler:(void(^)(UIImage *pikingImage))complete
{
    imagePikerSevice = [[TJSImagePicker alloc]init];
    imagePikerSevice.completionHandler = complete;
    [TJSHudAlert showLoadingViewInView:[UIViewController tjs_currentController].view];
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypeCamera;
    
    [imagePikerSevice requestAccessForMediaType:type
                                completeHandler:^(BOOL granted) {
        
        [TJSHudAlert  dimissLoadingView];
        
        if(granted){

            [imagePikerSevice openMediaType:type];
        }else{
            
            [imagePikerSevice openCameraSystemSetting];
        }
    }];
}


#pragma mark 弹出图库列表
+ (void)presentPhotoLibraryCompletionHandler:(void(^)(UIImage *pikingImage))complete
{
    imagePikerSevice = [[TJSImagePicker alloc]init];
    imagePikerSevice.completionHandler = complete;
    [TJSHudAlert showLoadingViewInView:[UIViewController tjs_currentController].view];
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [imagePikerSevice requestAccessForMediaType:type
                                completeHandler:^(BOOL granted) {
        
        [TJSHudAlert  dimissLoadingView];
        
        if(granted){
        
            [imagePikerSevice openMediaType:type];

        }else{
           
            [imagePikerSevice openPhotoSystemSetting];
        }
    }];
}


#pragma mark 弹出相册
+ (void)presentPhotoAlbumCompletionHandler:(void(^)(UIImage *pikingImage))complete{

    imagePikerSevice = [[TJSImagePicker alloc]init];
    imagePikerSevice.completionHandler = complete;
    [TJSHudAlert showLoadingViewInView:[UIViewController tjs_currentController].view];
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [imagePikerSevice requestAccessForMediaType:type
                                completeHandler:^(BOOL granted) {
        
         [TJSHudAlert  dimissLoadingView];
        
        if(granted){
            
            [imagePikerSevice openMediaType:type];
            
        }else{
            
            [imagePikerSevice openPhotoSystemSetting];
        }
    }];
}



#pragma mark private method

- (void)requestAccessForMediaType:(UIImagePickerControllerSourceType)type
                  completeHandler:(void(^)(BOOL granted))complete{

    
    /*
     AVAuthorizationStatusNotDetermined = 0,// 未进行授权选择
     AVAuthorizationStatusRestricted,　　　　// 未授权，且用户无法更新，如家长控制情况下
     AVAuthorizationStatusDenied,　　　　　　 // 用户拒绝App使用
     AVAuthorizationStatusAuthorized,　　　　// 已授权，可使用
     */
    
    if(type == UIImagePickerControllerSourceTypeCamera){
    
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        //Requests access to the underlying hardware for the media type, showing a dialog to the user if necessary.
        if(authStatus == AVAuthorizationStatusNotDetermined){
            
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted)
             {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     
                     if(complete)complete(granted);
                 });
             }];
            
        }else if ((authStatus == AVAuthorizationStatusRestricted ||
                  authStatus == AVAuthorizationStatusDenied) &&
                 IOS7_OR_LATER){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(complete)complete(NO);
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(complete)complete(YES);
            });
        }
        
    }else{
    
       PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        if(authStatus == PHAuthorizationStatusNotDetermined){
        
            //点击允许／不允许之后
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
               
                dispatch_async(dispatch_get_main_queue(), ^{
                    BOOL granted = (status==PHAuthorizationStatusAuthorized)?1:0;
                    if(complete)complete(granted);
                });
            }];
        
        }else if (authStatus == PHAuthorizationStatusDenied ||
                  authStatus == PHAuthorizationStatusRestricted){
        
            dispatch_async(dispatch_get_main_queue(), ^{
                if(complete)complete(NO);
            });
        }else{
        
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(complete)complete(YES);
            });
        }
    }
}

- (void)openMediaType:(UIImagePickerControllerSourceType)type{
    
    UIImagePickerControllerSourceType sourceType = type;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        self.imagePickerController.sourceType = sourceType;
        //设置图像选取控制器的类型为静态图像
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
        
        if(IOS8_OR_LATER){
            self.imagePickerController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        }
        
        if(sourceType==UIImagePickerControllerSourceTypeCamera){
         
            //self.imagePickerController.allowsEditing = YES;
            //self.imagePickerController.allowsImageEditing =YES;
            //self.imagePickerController.cameraOverlayView = nil;
            //self.imagePickerController.cameraViewTransform = nil;
            
            self.imagePickerController.showsCameraControls = YES;
            self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
            self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
            self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        }
        
        
        [[UIViewController tjs_currentController] presentViewController:self.imagePickerController animated:YES completion:nil];
        
    }else
    {
        if(type==UIImagePickerControllerSourceTypeCamera){
            
            if([[UIDevice currentDevice] tjs_isSimulator])
            {
               [self showAlert:TJMIPhoneSimulator
                    message:nil
                       sure:TJMCameraSure];
            }else{
               
                [self showAlert:TJMDeviceNotAvailable
                        message:nil
                           sure:TJMPhotoSure];
            }
        }else{
        
              [self showAlert:TJMDeviceNotAvailable
                      message:nil
                         sure:TJMPhotoSure];
        }
    }
}


- (void)openCameraSystemSetting{

    [self showAlert:TJMCameraUnuseful
            message:TJMPleaseSettingCamera
               sure:TJMCameraSure];
}
- (void)openPhotoSystemSetting{
    
    [self showAlert:TJMPhotoUnuseful
            message:TJMPleaseSettingPhoto
               sure:TJMPhotoSure];
}


#pragma mark UIImagePickerController

- (UIImagePickerController *)imagePickerController
{
    if (_imagePickerController == nil)
    {
        _imagePickerController               = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate      = self;
        
        
        UINavigationBar  *Bar;
        UIBarButtonItem  *BarItem;
        
        if (IOS9_OR_LATER){
            Bar       = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
            
            BarItem   = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        }else{
            
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Wdeprecated-declarations"
            
            Bar   = [UINavigationBar appearanceWhenContainedIn:[UIImagePickerController class], nil];
            BarItem   = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
            #pragma clang diagnostic pop
        }
        
        Bar.translucent=NO;
        Bar.barTintColor = ThemeService.main_color_00;
        Bar.tintColor    = ThemeService.main_color_02;
        [Bar setTitleTextAttributes:
         @{
           NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0f],
           NSForegroundColorAttributeName:ThemeService.origin_color_01
           }];
        
        
        //返回按钮 header-back
        UIImage *backImage = IMAGE(@"header-back");
        backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //must both be set if you want to customize the back indicator image.
        Bar.backIndicatorImage = backImage;
        Bar.backIndicatorTransitionMaskImage =backImage;
        
        
        [BarItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0,-60) forBarMetrics:UIBarMetricsDefault];
        
        UIFont  *font = [UIFont boldSystemFontOfSize:15.0f];
        UIColor *disablecolor = ThemeService.weak_color_00;
        UIColor *normalcolor  = ThemeService.main_color_02;
        [BarItem setTitleTextAttributes:@{
        NSFontAttributeName:font,NSForegroundColorAttributeName:normalcolor}
        forState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:@{
        NSFontAttributeName:font,NSForegroundColorAttributeName:disablecolor}
        forState:UIControlStateDisabled];
    }
    return _imagePickerController;
}


#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    /*
     // info dictionary keys
      UIImagePickerControllerMediaType       // an NSString (UTI, i.e. kUTTypeImage)
      UIImagePickerControllerOriginalImage   // a UIImage
      UIImagePickerControllerEditedImage     // a UIImage
      UIImagePickerControllerCropRect        // an NSValue (CGRect)
      UIImagePickerControllerMediaURL        // an NSURL
      UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
      UIImagePickerControllerMediaMetadata   // an NSDictionary containing metadata from a captured photo
      UIImagePickerControllerLivePhot        // a PHLivePhoto
     */
    
    WEAK_SELF(self);
    [picker dismissViewControllerAnimated:YES completion:^{
        
        STRONG_SELF(self);
        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        //@"public.image"
        if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
        {
            if(self){
                
                //获取用户编辑之后的图像
                UIImage *editedImage = [info objectForKey:self.imagePickerController.allowsEditing?UIImagePickerControllerEditedImage:UIImagePickerControllerOriginalImage];
            
                //将该图像保存到媒体库中
                //UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                if(self.completionHandler)self.completionHandler(editedImage);
                });
            }
        }
        else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
        {
            /*
            //获取视频文件的url
            NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
            //创建ALAssetsLibrary对象并将视频保存到媒体库
            ALAssetsLibrary* assetsLibrary = [[ALAssetsLibrary alloc] init];
            [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL completionBlock:^(NSURL *assetURL, NSError *error) {
                if (!error) {
                    //NSLog(@"captured video saved with no error.");
                }else
                {
                    //NSLog(@"error occured while saving the video:%@", error);
                }
             }];
          */
         
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    if ([picker isKindOfClass:[UIImagePickerController class]])
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark  savePhotoErrorSEL

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
      
    if (!error) {
        //NSLog(@"picture saved with no error.");
    }
    else
    {
        //NSLog(@"error occured while saving the picture%@", error);
    }
}


#pragma mark alert tool

- (void)showAlert:(NSString *)title
          message:(NSString *)message
             sure:(NSString *)sure{

    ALERT.title(title).message(message).actionButtonColor(UIColorFromHEX(0x007AFF)).action(sure,NULL).show();
}


@end
