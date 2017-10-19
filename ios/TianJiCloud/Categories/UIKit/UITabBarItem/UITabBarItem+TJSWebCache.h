//
//  UITabBarItem+TJSWebCache.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <TargetConditionals.h>

#if TARGET_OS_IOS || TARGET_OS_TV

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AFImageDownloader;

/**
 This category adds methods to the UIKit framework's `UIImageView` class. The methods in this category provide support for loading remote images asynchronously from a URL.
 */
@interface UITabBarItem (TJSWebCache)

///------------------------------------
/// @name Accessing the Image Downloader
///------------------------------------

/**
 Set the shared image downloader used to download images.

 @param imageDownloader The shared image downloader used to download images.
 */
+ (void)tjs_setSharedImageDownloader:(AFImageDownloader *)imageDownloader;

/**
 The shared image downloader used to download images.
 */
+ (AFImageDownloader *)tjs_sharedImageDownloader;

///--------------------
/// @name Setting Image
///--------------------

- (void)tjs_setImageWithURL:(NSURL *)url;

- (void)tjs_setImageWithURL:(NSURL *)url
       placeholderImage:(nullable UIImage *)placeholderImage;

- (void)tjs_setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(nullable UIImage *)placeholderImage
                       success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                       failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure;

/**
 Cancels any executing image operation for the receiver, if one exists.
 */
- (void)tjs_cancelImageDownloadTask;


- (void)tjs_setSelectedImageWithURL:(NSURL *)url;

- (void)tjs_setSelectedImageWithURL:(NSURL *)url
           placeholderImage:(nullable UIImage *)placeholderImage;

- (void)tjs_setSelectedImageWithURLRequest:(NSURLRequest *)urlRequest
                  placeholderImage:(nullable UIImage *)placeholderImage
                           success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                           failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure;

- (void)tjs_cancelSelectedImageDownloadTask;

@end

NS_ASSUME_NONNULL_END

#endif
