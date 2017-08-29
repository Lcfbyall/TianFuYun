//
//  RoadShowListApi.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "RoadShowListApi.h"

@implementation RoadShowListApi

#pragma mark - YTKBaseRequest

- (NSString *)requestUrl{
    
    return  [NSString stringWithFormat:@"%@",@""];
}

- (YTKRequestMethod)requestMethod{
    
    return YTKRequestMethodGET;
}

#pragma mark - TJSBaseRequest

- (BOOL)isNeedParameToken{
    
    return YES;
}

@end
