//
//  UIImageView+TJSWebCache.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (TJSWebCache)


- (void)tjs_setImageWithURL:(NSURL *_Nullable)url;

- (void)tjs_setImageWithURL:(NSURL *_Nullable)url
       placeholderImage:(nullable UIImage *)placeholderImage;

- (void)tjs_setImageWithURLRequest:(NSURLRequest *_Nullable)urlRequest
              placeholderImage:(nullable UIImage *)placeholderImage
                       success:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, UIImage * _Nullable image))success
                       failure:(nullable void (^)(NSURLRequest * _Nullable request, NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure;

- (void)tjs_cancelImageDownloadTask;


@end

NS_ASSUME_NONNULL_END
