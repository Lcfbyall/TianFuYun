//
//  TJMBaseRequest+TJMSingleRequestBlock.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJMBaseRequest+TJMSingleRequestBlock.h"
#import "TJSHudAlert.h"
//#import "TJMUnReadMessageApi.h"
#import "TJSLoginStateUtil.h"

@implementation TJMBaseRequest (TJMSingleRequestBlock)

- (void)request {
    [self requestWithSuccessBlock:nil];
}

- (void)requestWithSuccessBlock:(TJMRequestSuccessBlock)successBlock {
    
    [self requestWithSuccessBlock:successBlock failureBlock:nil];
}

- (void)requestWithSuccessBlock:(TJMRequestSuccessBlock)successBlock failureBlock:(TJMRequestFailureBlock)failureBlock {
    
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSDictionary *resultDict = request.responseObject;
        NSString *code = resultDict[kNetworkCode];
        NSString *msg = resultDict[kNetworkMsg];
        id data = resultDict[kNetworkData];
        if ([resultDict[kNetworkCode] integerValue] == kNetworkSuccess) {
            
            if (successBlock) {
                
                successBlock(data);
            }
        } else {
            
            // code = 1002 : token失效，token为空 重新登录    未读消息不弹出登录，没登录使用本地数据
            if (([resultDict[kNetworkCode] integerValue] == kNetworkTokenTimeOut || [resultDict[kNetworkCode] integerValue] == kNetworkTokenIsNull) && [self isNeedPresentLogin]) {
                
                [TJSLoginStateUtil resetLoginStateNotBackHome];
                
                return;
            }
            
            // 如果有错误msg，且允许提示的话，弹出错误提示
            if (STRING_IS_NOTNIL_NOTEMPTY(msg) && [self isNeedAlertFailureMessage]){
                
                
                [TJSHudAlert showViewWithInfo:msg];
            }
            if (failureBlock) {
                failureBlock(msg,code);
            }
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (failureBlock) {
            
            failureBlock(kNetworkStausErrorMsg,kNetworkStausErrorCode);
        }
    }];
}

@end
