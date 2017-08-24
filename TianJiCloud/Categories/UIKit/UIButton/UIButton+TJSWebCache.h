//
//  UIButton+TJSWebCache.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TJSWebCache)


- (void)tjs_setImageForState:(UIControlState)state
                 withURL:(NSURL *_Nullable)url;


- (void)tjs_setImageForState:(UIControlState)state
                 withURL:(NSURL *_Nullable)url
        placeholderImage:(nullable UIImage *)placeholderImage;


- (void)tjs_setImageForState:(UIControlState)state
          withURLRequest:(NSURLRequest *_Nullable)urlRequest
        placeholderImage:(nullable UIImage *)placeholderImage
                 success:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, UIImage * _Nullable image))success
                 failure:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure;

- (void)tjs_setBackgroundImageForState:(UIControlState)state
                           withURL:(NSURL *_Nullable)url;


- (void)tjs_setBackgroundImageForState:(UIControlState)state
                           withURL:(NSURL *_Nullable)url
                  placeholderImage:(nullable UIImage *)placeholderImage;

- (void)tjs_setBackgroundImageForState:(UIControlState)state
                    withURLRequest:(NSURLRequest *_Nullable)urlRequest
                  placeholderImage:(nullable UIImage *)placeholderImage
                           success:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, UIImage * _Nullable image))success
                           failure:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure;


- (void)tjs_cancelImageDownloadTaskForState:(UIControlState)state;


- (void)tjs_cancelBackgroundImageDownloadTaskForState:(UIControlState)state;



@end
