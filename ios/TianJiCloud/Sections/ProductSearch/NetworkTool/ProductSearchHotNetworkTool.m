//
//  ProductSearchHotNetworkTool.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchHotNetworkTool.h"
#import "ProductSearchHotApi.h"

@implementation ProductSearchHotNetworkTool

+ (void)requestWithParameters:(id)parameters successCallback:(TJSSuccessCompletionBlock)success failCallback:(TJSFailCompletionBlock)fail{

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    ProductSearchHotApi *api = [[ProductSearchHotApi alloc]initWithParame:params];
    api.needLoading = YES;
    
    [api requestWithSuccessBlock:^(__kindof id  _Nullable data) {
        
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
        
    }];

}

@end
