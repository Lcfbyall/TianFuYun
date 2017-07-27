//
//  TJSConstKeyForNetworkDefine.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSConstKeyForNetworkDefine_h
#define TJSConstKeyForNetworkDefine_h


//*** 1. 网络接口


//*** 2. 返回字段
static NSString *const kNetworkData = @"data";
static NSString *const kNetworkMsg  = @"msg";
static NSString *const kNetworkCode = @"code";


//*** 3. 状态码
static NSInteger const kNetworkSuccess        = 1;
static NSString *const kNetworkError          = @"error";
static NSString *const kNetworkStausErrorMsg  = @"网络错误,请检查您当前的网络状况";
static NSString *const kNetworkStausErrorCode = @"10086";
// request error code
static NSInteger const kNetworkTokenTimeOut   = 1002;
// token is bull
static NSInteger const kNetworkTokenIsNull    = 1001;



#endif /* TJSConstKeyForNetworkDefine_h */
