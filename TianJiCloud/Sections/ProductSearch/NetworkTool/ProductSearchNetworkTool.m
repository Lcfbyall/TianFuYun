//
//  ProductSearchNetworkTool.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchNetworkTool.h"
#import "ProductSearchApi.h"

@implementation ProductSearchNetworkTool

+ (void)requestWithParameters:(id)parameters successCallback:(TJSSuccessCompletionBlock)success failCallback:(TJSFailCompletionBlock)fail{
 
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    ProductSearchApi *api = [[ProductSearchApi alloc]initWithParame:params];
    
    api.needLoading = YES;
    
    [api requestWithSuccessBlock:^(__kindof id  _Nullable data) {
        
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
        
    }];

}

@end
