//
//  TJSWeakScriptMessageHandler.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//
#import "TJSWeakScriptMessageHandler.h"

@implementation TJSWeakScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    
    [self.scriptMessageHandler userContentController:userContentController didReceiveScriptMessage:message];
}

- (void)dealloc {
    NSLog(@"weakScriptMessageHandler dealloc");
}

@end
