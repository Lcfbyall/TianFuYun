//
//  TJSAppVersionApi.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSAppVersionApi.h"

@implementation TJSAppVersionApi

#pragma mark - YTKBaseRequest

- (NSString *)requestUrl{
    
    return [NSString stringWithFormat:@"%@",@""];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

#pragma mark - TJSBaseRequest

- (BOOL)isNeedParameToken{
    
    return NO;
}


@end
