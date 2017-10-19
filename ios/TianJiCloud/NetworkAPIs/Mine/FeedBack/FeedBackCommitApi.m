//
//  FeedBackCommitApi.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FeedBackCommitApi.h"

@implementation FeedBackCommitApi

#pragma mark - YTKBaseRequest

- (NSString *)requestUrl{
    
    return  [NSString stringWithFormat:@"%@",@""];
}

- (YTKRequestMethod)requestMethod{
    
    return YTKRequestMethodPOST;
}

#pragma mark - TJSBaseRequest

- (BOOL)isNeedParameToken{
    
    return YES;
}

@end
