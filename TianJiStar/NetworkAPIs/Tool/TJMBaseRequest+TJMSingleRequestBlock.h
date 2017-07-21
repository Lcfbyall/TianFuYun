//
//  TJMBaseRequest+TJMSingleRequestBlock.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJMBaseRequest.h"

typedef void(^TJMRequestSuccessBlock)(__kindof id _Nullable data);
typedef void(^TJMRequestFailureBlock)(__kindof NSString* _Nullable msg, NSString* _Nullable code);

@interface TJMBaseRequest (TJMSingleRequestBlock)

// 只针对于单个请求
- (void)request;
- (void)requestWithSuccessBlock:(TJMRequestSuccessBlock _Nullable)successBlock;
- (void)requestWithSuccessBlock:(TJMRequestSuccessBlock _Nullable)successBlock
                   failureBlock:(TJMRequestFailureBlock _Nullable)failureBlock;



@end
