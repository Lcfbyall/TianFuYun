//
//  TJSBaseRequest+TJSSingleRequestBlock.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseRequest.h"

typedef void(^TJSRequestSuccessBlock)(__kindof id _Nullable data);
typedef void(^TJSRequestFailureBlock)(__kindof NSString* _Nullable msg, NSString* _Nullable code);

@interface TJSBaseRequest (TJSSingleRequestBlock)

// 只针对于单个请求
- (void)request;
- (void)requestWithSuccessBlock:(TJSRequestSuccessBlock _Nullable)successBlock;
- (void)requestWithSuccessBlock:(TJSRequestSuccessBlock _Nullable)successBlock
                   failureBlock:(TJSRequestFailureBlock _Nullable)failureBlock;



@end
