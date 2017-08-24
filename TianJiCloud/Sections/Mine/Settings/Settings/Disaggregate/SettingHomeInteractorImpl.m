//
//  SettingHomeInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeInteractorImpl.h"
#import "TJSActionSheet.h"
#import "TJSImagePicker.h"

@implementation SettingHomeInteractorImpl

#pragma mark - <SettingHomeInteractor>


- (NSArray *)items{
 
    return self.dataSource.items;
}

- (void)logout:(void (^)(id))block{
  
    [self.dataSource logout:^(id result) {
        
        [UIViewController tjs_popViewControllerAnimated:YES];
        
        if(block) block(result);
        
    }];
}

- (void)uploadIcon:(UIImage *)icon block:(void (^)(id))block{
  
    [self.dataSource uploadIcon:icon block:^(id reslut) {
        
        if(block) block(reslut);
    }];
}


- (void)presentImageAcitonSheet:(void (^)(id))block{

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
        
    }).actionButtonColor(ThemeService.text_color_01).cancelButtonColor([UIColor redColor]).show();
    
    //
    [self.layout presentImageAcitonSheet:^(id value) {
        
        if(block)block(value);
    }];
}


#pragma mark - <SettingHomeLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
