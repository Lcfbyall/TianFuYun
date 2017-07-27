//
//  ProductListNetworkTool.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListNetworkTool.h"

#import "TJSProductListApi.h"
#import "TJSProductInfo.h"

@implementation ProductListNetworkTool

+ (void)requestWithParameters:(id)parameters
              successCallback:(TJSSuccessCompletionBlock)success
                 failCallback:(TJSFailCompletionBlock)fail{

    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    TJSProductListApi *api = [[TJSProductListApi alloc]initWithParame:param];
    api.needLoading = NO;
    
    [api requestWithSuccessBlock:^(__kindof id  _Nullable data) {
        
        
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in data) {
            
   
        }
        
        success?success(modelArray.count?modelArray:nil):nil;
        
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
        NSLog(@"%@",msg);
        fail?fail(msg):nil;
    }];

}

@end
