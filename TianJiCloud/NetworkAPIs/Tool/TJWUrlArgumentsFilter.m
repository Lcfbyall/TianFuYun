//
//  TJWUrlArgumentsFilter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//
#import "TJWUrlArgumentsFilter.h"
#import "AFURLRequestSerialization.h"

@implementation TJWUrlArgumentsFilter {
    NSDictionary *_arguments;
}

+ (TJWUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    
    
    return [self urlStringWithOriginUrlString:originUrl appendParameters:_arguments request:request];
}

- (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameters request:(YTKBaseRequest *)request {
    
    
    NSString *paraUrlString = AFQueryStringFromParameters(parameters);
    
    // 登录注册不添加token
    BOOL isLoginRegister = [originUrlString containsString:@"login"]||[originUrlString containsString:@"register"]||[originUrlString containsString:@"getSms"];
    BOOL isContainsTokenParame = [paraUrlString containsString:@"token"];
    
    if (isLoginRegister && isContainsTokenParame) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
        [dic removeObjectForKey:@"token"];
        paraUrlString = AFQueryStringFromParameters(dic);
    }
    
    if (!(paraUrlString.length > 0)) {
        return originUrlString;
    }
    
    if (request.useCDN) {
        return originUrlString;
    }
    
    BOOL useDummyUrl = NO;
    static NSString *dummyUrl = nil;
    NSURLComponents *components = [NSURLComponents componentsWithString:originUrlString];
    if (!components) {
        useDummyUrl = YES;
        if (!dummyUrl) {
            dummyUrl = @"http://www.dummy.com";
        }
        components = [NSURLComponents componentsWithString:dummyUrl];
    }
    
    NSString *queryString = components.query ?: @"";
    NSString *newQueryString = [queryString stringByAppendingFormat:queryString.length > 0 ? @"&%@" : @"%@", paraUrlString];
    
    components.query = newQueryString;
    
    if (useDummyUrl) {
        return [components.URL.absoluteString substringFromIndex:dummyUrl.length - 1];
    } else {
        return components.URL.absoluteString;
    }
}
@end
