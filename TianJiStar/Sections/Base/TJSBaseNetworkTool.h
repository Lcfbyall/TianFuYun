//
//  TJSNetworkTool.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseRequest+TJSSingleRequestBlock.h"
#import <YYModel.h>

typedef void(^TJSSuccessCompletionBlock)(_Nullable id);
typedef void(^TJSFailCompletionBlock)(_Nullable id);

@protocol TJSNetworkToolProtocol <NSObject>

+ (void)requestWithParameters:(_Nullable id)parameters
              successCallback:(TJSSuccessCompletionBlock _Nullable)success
                 failCallback:(TJSFailCompletionBlock _Nullable)fail;

@end


@interface TJSBaseNetworkTool : NSObject<TJSNetworkToolProtocol>




@end
