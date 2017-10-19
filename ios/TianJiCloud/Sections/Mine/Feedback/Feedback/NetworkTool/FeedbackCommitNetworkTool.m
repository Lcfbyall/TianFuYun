//
//  FeedbackCommitNetworkTool.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FeedbackCommitNetworkTool.h"

#import "FeedBackCommitApi.h"


@implementation FeedbackCommitNetworkTool

+ (void)requestWithParameters:(id)parameters successCallback:(TJSSuccessCompletionBlock)success failCallback:(TJSFailCompletionBlock)fail{

    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:parameters];
    FeedBackCommitApi *api = [[FeedBackCommitApi alloc]initWithParame:param];
    api.needLoading = YES;
    [api requestWithSuccessBlock:^(__kindof id  _Nullable data) {
        
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
        
    }];
}

@end
