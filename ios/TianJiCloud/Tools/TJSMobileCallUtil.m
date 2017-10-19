//
//  TJSMobileCallUtil.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMobileCallUtil.h"


static NSString *const kCustomerServiceTel = @"18611111112";


@implementation TJSMobileCallUtil


+ (void)callUtilToCallCustomerService {
    [self callUtilToCallPhone:kCustomerServiceTel];
}

+ (void)callUtilToCallPhone:(NSString *)phone{

    
    NSString *allString = phone;
    
    if (![phone hasPrefix:@"tel:"]) {
        allString = [@"tel:" stringByAppendingString:phone];
    }
    
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:allString]]];
    
    [[UIViewController tjs_currentController].view addSubview:callWebview];
}



@end
