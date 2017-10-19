//
//  TJSWeakScriptMessageHandler.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface TJSWeakScriptMessageHandler : NSObject <WKScriptMessageHandler>

@property (nonatomic, weak) id scriptMessageHandler;

@end
