//
//  FeedbackCommitNetworkTool.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FeedbackCommitNetworkTool.h"

#import "FeedbackCommitApi.h"


@implementation FeedbackCommitNetworkTool

+ (void)requestWithParameters:(id)parameters successCallback:(TJSSuccessCompletionBlock)success failCallback:(TJSFailCompletionBlock)fail{

    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:parameters];
    FeedbackCommitApi *api = [[FeedbackCommitApi alloc]initWithParame:param];
    api.needLoading = YES;
    [api requestWithSuccessBlock:^(__kindof id  _Nullable data) {
        
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
        
    }];
}

@end
