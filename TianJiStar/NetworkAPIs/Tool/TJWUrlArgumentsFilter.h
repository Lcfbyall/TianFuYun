//
//  TJWUrlArgumentsFilter.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"
#import "YTKBaseRequest.h"

// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface TJWUrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>

+ (TJWUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;

@end
