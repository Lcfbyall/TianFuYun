//
//  TJSBaseRequest.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseRequest.h"
#import "AFURLResponseSerialization.h"
#import "TJSAnimatingRequestAccessory.h"


@implementation TJSBaseRequest {
    NSDictionary *_parame;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithParame:(NSDictionary *)parame {
    self = [super init];
    if (self) {
        _parame = parame;
    }
    return self;
}

- (NSDictionary *)filterWithParames:(NSDictionary *)parames{

    NSDictionary *paramDic = parames;
    
    if ([self isNeedParameToken]) {
        NSString *token = [GVUserDefaults standardUserDefaults].token;
        if (STRING_IS_NOTNIL_NOTEMPTY(token) ) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parames];
            [dic setValue:token forKey:kToken];
            paramDic = dic;
        }
    }
    
    return paramDic;
}




#pragma mark - YTKBaseRequest Override

- (NSTimeInterval)requestTimeoutInterval {
    return 120;
}

// 默认使用json格式请求
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

//这里暂不考虑JSONModel解析错误的问题

- (void)requestFailedPreprocessor
{
    // NOTE: 子类如需继承，必须必须调用 [super requestFailedPreprocessor];
    NSError * error = self.error;
    
    if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain])
    {
        //AFNetworking处理过的错误
        
    }else if ([error.domain isEqualToString:YTKRequestValidationErrorDomain])
    {
        //猿题库处理过的错误
        
    }else{
        //系统级别的domain错误，无网络等[NSURLErrorDomain]
        //根据error的code去定义显示的信息，保证显示的内容可以便捷的控制
    }
}

- (void)requestFailedFilter {
    
    if (![self isHidenErrorToast]) {
        // TODO: 错误提示处理，不同error code不同处理
        [TJSHudAlert  showViewWithInfo:kNetworkStausErrorMsg];
    }
}

- (id)requestArgument {
    return [self filterWithParames:_parame];
}



#pragma mark - Subclass Override

- (BOOL)isHidenErrorToast {
    return NO;
}

- (BOOL)isNeedParameToken {
    return YES;
}

- (BOOL)isNeedPresentLogin {
    return YES;
}

- (BOOL)isNeedAlertFailureMessage {
    return YES;
}




#pragma mark - private method

- (void)configLoading {
    if (self.needLoading) {
        self.animatingText = @"loading";
        self.animatingView = [UIViewController tjs_currentController].view;
    }else {
        self.animatingView = nil;
    }
}

#pragma mark - setter

- (void)setNeedLoading:(BOOL)needLoading {
    _needLoading = needLoading;
    [self configLoading];
}

@end
