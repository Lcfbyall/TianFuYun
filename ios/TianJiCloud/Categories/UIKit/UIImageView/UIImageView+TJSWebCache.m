//
//  UIImageView+TJSWebCache.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIImageView+TJSWebCache.h"
#import "UIImageView+AFNetworking.h"


@implementation UIImageView (TJSWebCache)

- (void)tjs_setImageWithURL:(NSURL *_Nullable)url{

    [self setImageWithURL:url];
}

- (void)tjs_setImageWithURL:(NSURL *_Nullable)url
           placeholderImage:(nullable UIImage *)placeholderImage{

    [self setImageWithURL:url placeholderImage:placeholderImage];
}

- (void)tjs_setImageWithURLRequest:(NSURLRequest *_Nullable)urlRequest
                  placeholderImage:(nullable UIImage *)placeholderImage
                           success:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, UIImage * _Nullable image))success
                           failure:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure{
  
    [self setImageWithURLRequest:urlRequest placeholderImage:placeholderImage success:success failure:failure];

}

- (void)tjs_cancelImageDownloadTask{

    [self cancelImageDownloadTask];
}


@end
