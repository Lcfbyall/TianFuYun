//
//  ProductDeleteNetworkTool.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductDeleteNetworkTool.h"

#import "TJSProductDeleteApi.h"
#import "TJSProductInfo.h"

@implementation ProductDeleteNetworkTool

+ (void)requestWithParameters:(id)parameters
              successCallback:(TJSSuccessCompletionBlock)success
                 failCallback:(TJSFailCompletionBlock)fail{
    
    //参数:
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    TJSProductDeleteApi *api = [[TJSProductDeleteApi alloc]initWithParame:param];
    api.needLoading = NO;
    
    [api requestWithSuccessBlock:^(__kindof id  _Nullable data) {
        
    
        success?success(data):nil;
        
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
        NSLog(@"%@",msg);
        fail?fail(msg):nil;
    }];

}

@end
