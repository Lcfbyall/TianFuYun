//
//  TJSProductDeleteApi.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductDeleteApi.h"

@interface TJSProductDeleteApi ()

@end

@implementation TJSProductDeleteApi


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

