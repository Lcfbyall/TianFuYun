//
//  APWebViewController.m
//  AliSDKDemo
//
//  Created by 亦澄 on 16-1-5.
//  Copyright (c) 2016年 Alipay. All rights reserved.
//

#import "APWebViewController.h"
//#import <AlipaySDK/AlipaySDK.h>

@interface APWebViewController ()

@property (nonatomic, strong)UIView* maskView;
@property (nonatomic, strong)UIView* urlInputView;
@property (nonatomic, strong)UITextField* urlInput;

@end


@implementation APWebViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.webView.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;

    // 加载已经配置的url
    NSString* webUrl = [[NSUserDefaults standardUserDefaults]objectForKey:@"alipayweburl"];
    if (webUrl.length > 0) {
        //[self loadWithUrlStr:webUrl];
    }
}

/*

#pragma mark -
#pragma mark   ============== webview相关 回调及加载 ==============

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
//    //老版本对H5拦截支付分两步骤：1、获取订单串；2、订单串非空，则进行支付
//    NSString* orderInfo = [[AlipaySDK defaultService]fetchOrderInfoFromH5PayUrl:[request.URL absoluteString]];
//    if (orderInfo.length > 0) {
//        [self payWithUrlOrder:orderInfo];
//        return NO;
//    }
//    return YES;
    
    //新版本的H5拦截支付对老版本的获取订单串和订单支付接口进行合并，推荐使用该接口
    __weak APWebViewController* wself = self;
    BOOL isIntercepted = [[AlipaySDK defaultService] payInterceptorWithUrl:[request.URL absoluteString] fromScheme:@"alisdkdemo" callback:^(NSDictionary *result) {
        // 处理支付结果
        NSLog(@"%@", result);
        // isProcessUrlPay 代表 支付宝已经处理该URL
        if ([result[@"isProcessUrlPay"] boolValue]) {
            // returnUrl 代表 第三方App需要跳转的成功页URL
            NSString* urlStr = result[@"returnUrl"];
            [wself loadWithUrlStr:urlStr];
        }
    }];
    
    if (isIntercepted) {
        return NO;
    }
    return YES;
}


#pragma mark - Private

- (void)loadWithUrlStr:(NSString*)urlStr
{
    if (urlStr.length > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSURLRequest *webRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]
                                                        cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                    timeoutInterval:30];
            [self.webView loadRequest:webRequest];
        });
    }
}


#pragma mark -
#pragma mark   ============== URL pay 开始支付 ==============

- (void)payWithUrlOrder:(NSString*)urlOrder
{
    if (urlOrder.length > 0) {
        __weak APWebViewController* wself = self;
        [[AlipaySDK defaultService] payUrlOrder:urlOrder fromScheme:@"alisdkdemo" callback:^(NSDictionary* result) {
            // 处理支付结果
            NSLog(@"%@", result);
            // isProcessUrlPay 代表 支付宝已经处理该URL
            if ([result[@"isProcessUrlPay"] boolValue]) {
                
                // returnUrl 代表 第三方App需要跳转的成功页URL
                NSString* urlStr = result[@"returnUrl"];
                [wself loadWithUrlStr:urlStr];
            }
        }];
    }
}


- (IBAction)onOpenInputedUrl:(id)sender
{
    
    NSString* urlStr = self.urlInput.text;
    if (urlStr.length > 0) {
        if (![urlStr hasPrefix:@"http"]) {
            urlStr = [NSString stringWithFormat:@"http://%@", urlStr];
        }
        [[NSUserDefaults standardUserDefaults] setObject:urlStr forKey:@"alipayweburl"];
        [self loadWithUrlStr:urlStr];
    }
}
 
 */

@end
