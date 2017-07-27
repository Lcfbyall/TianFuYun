//
//  TJSBaseWebViewController.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

#import <WebKit/WebKit.h>
@class TJSWeakScriptMessageHandler;

@protocol TJSBaseWebProtocol <NSObject>

@property (strong, nonatomic,readonly) WKWebView *tjs_wkWebView;

/**
 变更 wkwebview 的布局
 
 @param edgeInset 上-左-下-右
 */
- (void)tjs_updateConstraintsWithEdgeInsets:(UIEdgeInsets)edgeInset;

/**
 添加刷新
 */
- (void)tjs_configRefreshHeader;

@end



@interface TJSBaseWebViewController : TJSBaseViewController <WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,TJSBaseWebProtocol>

@end
