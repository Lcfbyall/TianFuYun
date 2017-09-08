//
//  UITabBarItem+TJSWebCache.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITabBarItem+TJSWebCache.h"

#import <objc/runtime.h>

#if TARGET_OS_IOS || TARGET_OS_TV

#import "AFImageDownloader.h"

@interface UITabBarItem (_TJSWebCache)

@property (readwrite, nonatomic, strong, setter = af_setActiveImageDownloadReceipt:) AFImageDownloadReceipt *af_activeImageDownloadReceipt;

@property (readwrite, nonatomic, strong, setter = af_setActiveImageDownloadReceipt:) AFImageDownloadReceipt *af_activeSelectedImageDownloadReceipt;

@end

@implementation UITabBarItem (_TJSWebCache)

- (AFImageDownloadReceipt *)af_activeImageDownloadReceipt {
    return (AFImageDownloadReceipt *)objc_getAssociatedObject(self, @selector(af_activeImageDownloadReceipt));
}

- (void)af_setActiveImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt {
    objc_setAssociatedObject(self, @selector(af_activeImageDownloadReceipt), imageDownloadReceipt, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AFImageDownloadReceipt *)af_activeSelectedImageDownloadReceipt {
    return (AFImageDownloadReceipt *)objc_getAssociatedObject(self, @selector(af_activeSelectedImageDownloadReceipt));
}

- (void)af_setActiveSelectedImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt {
    
    objc_setAssociatedObject(self, @selector(af_activeSelectedImageDownloadReceipt), imageDownloadReceipt, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

#pragma mark -

@implementation UITabBarItem (TJSWebCache)

+ (AFImageDownloader *)tjs_sharedImageDownloader {

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
    return objc_getAssociatedObject(self, @selector(tjs_sharedImageDownloader)) ?: [AFImageDownloader defaultInstance];
#pragma clang diagnostic pop
}

+ (void)tjs_setSharedImageDownloader:(AFImageDownloader *)imageDownloader {
    objc_setAssociatedObject(self, @selector(tjs_sharedImageDownloader), imageDownloader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark - setImageWithURL

- (void)tjs_setImageWithURL:(NSURL *)url {
    [self tjs_setImageWithURL:url placeholderImage:nil];
}

- (void)tjs_setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];

    [self tjs_setImageWithURLRequest:request placeholderImage:placeholderImage success:nil failure:nil];
}

- (void)tjs_setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure
{

    if ([urlRequest URL] == nil) {
        [self tjs_cancelImageDownloadTask];
        self.image = placeholderImage;
        return;
    }

    if ([self tjs_isActiveTaskURLEqualToURLRequest:urlRequest]){
        return;
    }

    [self tjs_cancelImageDownloadTask];

    AFImageDownloader *downloader = [[self class] tjs_sharedImageDownloader];
    id <AFImageRequestCache> imageCache = downloader.imageCache;

    //Use the image from the image cache if it exists
    UIImage *cachedImage = [imageCache imageforRequest:urlRequest withAdditionalIdentifier:nil];
    if (cachedImage) {
        if (success) {
            success(urlRequest, nil, cachedImage);
        } else {
            self.image = cachedImage;
        }
        [self tjs_clearActiveDownloadInformation];
    } else {
        if (placeholderImage) {
            self.image = placeholderImage;
        }

        __weak __typeof(self)weakSelf = self;
        NSUUID *downloadID = [NSUUID UUID];
        AFImageDownloadReceipt *receipt;
        receipt = [downloader
                   downloadImageForURLRequest:urlRequest
                   withReceiptID:downloadID
                   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
                       __strong __typeof(weakSelf)strongSelf = weakSelf;
                       if ([strongSelf.af_activeImageDownloadReceipt.receiptID isEqual:downloadID]) {
                           if (success) {
                               success(request, response, responseObject);
                           } else if(responseObject) {
                               strongSelf.image = responseObject;
                           }
                           [strongSelf tjs_clearActiveDownloadInformation];
                       }

                   }
                   failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                       __strong __typeof(weakSelf)strongSelf = weakSelf;
                        if ([strongSelf.af_activeImageDownloadReceipt.receiptID isEqual:downloadID]) {
                            if (failure) {
                                failure(request, response, error);
                            }
                            [strongSelf tjs_clearActiveDownloadInformation];
                        }
                   }];

        self.af_activeImageDownloadReceipt = receipt;
    }
}

- (void)tjs_cancelImageDownloadTask {
    
    if (self.af_activeImageDownloadReceipt != nil) {
        
        [[self.class tjs_sharedImageDownloader] cancelTaskForImageDownloadReceipt:self.af_activeImageDownloadReceipt];
        
        [self tjs_clearActiveDownloadInformation];
     }
}

- (void)tjs_clearActiveDownloadInformation {
    self.af_activeImageDownloadReceipt = nil;
}

- (BOOL)tjs_isActiveTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest {
    return [self.af_activeImageDownloadReceipt.task.originalRequest.URL.absoluteString isEqualToString:urlRequest.URL.absoluteString];
}


#pragma mark - setSelectedImageWithURL

- (void)tjs_setSelectedImageWithURL:(NSURL *)url{

      [self tjs_setSelectedImageWithURL:url placeholderImage:nil];
}

- (void)tjs_setSelectedImageWithURL:(NSURL *)url
                   placeholderImage:(nullable UIImage *)placeholderImage{

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    [self tjs_setSelectedImageWithURLRequest:request placeholderImage:placeholderImage success:nil failure:nil];
}

- (void)tjs_setSelectedImageWithURLRequest:(NSURLRequest *)urlRequest
                          placeholderImage:(nullable UIImage *)placeholderImage
                                   success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                                   failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure{

    
    if ([urlRequest URL] == nil) {
        [self tjs_cancelSelectedImageDownloadTask];
        self.selectedImage = placeholderImage;
        return;
    }
    
    if ([self tjs_isActiveSelectedTaskURLEqualToURLRequest:urlRequest]){
        return;
    }
    
    [self tjs_cancelSelectedImageDownloadTask];
    
    AFImageDownloader *downloader = [[self class] tjs_sharedImageDownloader];
    id <AFImageRequestCache> imageCache = downloader.imageCache;
    
    //Use the image from the image cache if it exists
    UIImage *cachedImage = [imageCache imageforRequest:urlRequest withAdditionalIdentifier:nil];
    if (cachedImage) {
        if (success) {
            success(urlRequest, nil, cachedImage);
        } else {
            self.selectedImage = cachedImage;
        }
        [self tjs_clearActiveSelectedDownloadInformation];
    } else {
        if (placeholderImage) {
            self.selectedImage = placeholderImage;
        }
        
        __weak __typeof(self)weakSelf = self;
        NSUUID *downloadID = [NSUUID UUID];
        AFImageDownloadReceipt *receipt;
        receipt = [downloader
                   downloadImageForURLRequest:urlRequest
                   withReceiptID:downloadID
                   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
                       __strong __typeof(weakSelf)strongSelf = weakSelf;
                       if ([strongSelf.af_activeSelectedImageDownloadReceipt.receiptID isEqual:downloadID]) {
                           if (success) {
                               success(request, response, responseObject);
                           } else if(responseObject) {
                               strongSelf.selectedImage = responseObject;
                           }
                           [strongSelf tjs_clearActiveSelectedDownloadInformation];
                       }
                       
                   }
                   failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                       __strong __typeof(weakSelf)strongSelf = weakSelf;
                       if ([strongSelf.af_activeSelectedImageDownloadReceipt.receiptID isEqual:downloadID]) {
                           
                           if (failure) {
                               failure(request, response, error);
                           }
                           [strongSelf tjs_clearActiveSelectedDownloadInformation];
                       }
                   }];
        
        self.af_activeSelectedImageDownloadReceipt = receipt;
    }

}


- (void)tjs_cancelSelectedImageDownloadTask{

    if (self.af_activeSelectedImageDownloadReceipt != nil) {
        
        [[self.class tjs_sharedImageDownloader] cancelTaskForImageDownloadReceipt:self.af_activeSelectedImageDownloadReceipt];
        
        [self tjs_clearActiveSelectedDownloadInformation];
    }
}

- (void)tjs_clearActiveSelectedDownloadInformation {
    self.af_activeSelectedImageDownloadReceipt = nil;
}

- (BOOL)tjs_isActiveSelectedTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest {
    
    return [self.af_activeSelectedImageDownloadReceipt.task.originalRequest.URL.absoluteString isEqualToString:urlRequest.URL.absoluteString];
}

@end

#endif
