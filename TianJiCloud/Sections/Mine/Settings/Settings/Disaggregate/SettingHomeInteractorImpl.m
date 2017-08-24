//
//  SettingHomeInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeInteractorImpl.h"


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

    //获取图片
    [TJSAlertHandleUtil actionSheetHandleWhenUploadProfileIcon:^(id result) {
       
        if(block)block(result);
    }];
    
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
