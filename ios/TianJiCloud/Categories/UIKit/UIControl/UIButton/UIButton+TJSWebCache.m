//
//  UIButton+TJSWebCache.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIButton+TJSWebCache.h"
#import "UIButton+AFNetworking.h"

@implementation UIButton (TJSWebCache)

- (void)tjs_setImageForState:(UIControlState)state
                     withURL:(NSURL *_Nullable)url{
  
    [self setImageForState:state withURL:url];
}


- (void)tjs_setImageForState:(UIControlState)state
                     withURL:(NSURL *_Nullable)url
            placeholderImage:(nullable UIImage *)placeholderImage{
 
    [self setImageForState:state withURL:url placeholderImage:placeholderImage];
  
}


- (void)tjs_setImageForState:(UIControlState)state
              withURLRequest:(NSURLRequest *_Nullable)urlRequest
            placeholderImage:(nullable UIImage *)placeholderImage
                     success:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, UIImage * _Nullable image))success
                     failure:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure{
   
    [self setImageForState:state withURLRequest:urlRequest placeholderImage:placeholderImage success:success failure:failure];

}



#pragma mark - tjs_setBackgroundImageForState

- (void)tjs_setBackgroundImageForState:(UIControlState)state
                               withURL:(NSURL *_Nullable)url{

    [self setBackgroundImageForState:state withURL:url];
}


- (void)tjs_setBackgroundImageForState:(UIControlState)state
                               withURL:(NSURL *_Nullable)url
                      placeholderImage:(nullable UIImage *)placeholderImage{

    [self setBackgroundImageForState:state withURL:url placeholderImage:placeholderImage];
    
}

- (void)tjs_setBackgroundImageForState:(UIControlState)state
                        withURLRequest:(NSURLRequest *_Nullable)urlRequest
                      placeholderImage:(nullable UIImage *)placeholderImage
                               success:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, UIImage * _Nullable image))success
                               failure:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure{

    [self setBackgroundImageForState:state withURLRequest:urlRequest placeholderImage:placeholderImage success:success failure:failure];
}



#pragma mark - cancel

- (void)tjs_cancelImageDownloadTaskForState:(UIControlState)state{
 
    [self cancelImageDownloadTaskForState:state];

}

- (void)tjs_cancelBackgroundImageDownloadTaskForState:(UIControlState)state{

    [self cancelBackgroundImageDownloadTaskForState:state];
}


@end
