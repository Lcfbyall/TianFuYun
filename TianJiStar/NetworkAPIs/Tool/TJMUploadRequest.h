//
//  TJMUploadRequest.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString * _Nonnull kTJMUploadMimeTypeImage = @"image/jpeg";
static const NSString * _Nonnull kTJMUploadCredenceUrl = @"/app/authentication/upload.g";

@interface TJMUploadRequest : NSObject


typedef void(^TJMUploadProgressBlock)(NSProgress * _Nonnull uploadProgress);
typedef void(^TJMUploadCompletionHandler)(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error);


+ (NSURLSessionUploadTask * _Nullable)uploadWithFileData:(NSData * _Nullable)fileData
                                                    name:(NSString * _Nonnull)name
                                                fileName:(NSString * _Nonnull)fileName
                                                mimeType:(NSString * _Nonnull)mimeType
                                                  urlStr:(NSString * _Nonnull)urlStr
                                              parameters:(NSDictionary * _Nullable)parameters
                                                progress:(TJMUploadProgressBlock _Nullable)uploadProgress
                                       completionHandler:(TJMUploadCompletionHandler _Nullable)handler;

/**
 *  文件上传接口
 *
 *  @param fileData       文件data
 *  @param filePath       文件存储在沙盒路径
 *  @param name           key
 *  @param fileName       文件名
 *  @param mimeType       文件类型例如 image/jpeg
 *  @param urlStr         url
 *  @param parameters     body
 *  @param uploadProgress 进度回调
 *  @param handler        处理成功/失败
 *
 *  @return NSURLSessionUploadTask
 */
+ (NSURLSessionUploadTask * _Nullable)uploadWithFileData:(NSData * _Nullable)fileData
                                                filePath:(NSString * _Nullable)filePath
                                                    name:(NSString * _Nonnull)name
                                                fileName:(NSString * _Nonnull)fileName
                                                mimeType:(NSString * _Nonnull)mimeType
                                                  urlStr:(NSString * _Nonnull)urlStr
                                              parameters:(NSDictionary * _Nullable)parameters
                                                progress:(TJMUploadProgressBlock _Nullable)uploadProgress
                                       completionHandler:(TJMUploadCompletionHandler _Nullable)handler;

@end
