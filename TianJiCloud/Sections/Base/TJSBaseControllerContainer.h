//
//  TJSBaseControllerContainer.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseViewController.h"

@protocol TJSBaseControllerContainerProtocol <NSObject>

@required

- (UIScrollView *)tjs_contentScroll;

- (void)tjs_setupChildViewControllers;



@end

@interface TJSBaseControllerContainer : TJSBaseViewController<TJSBaseControllerContainerProtocol,UIScrollViewDelegate>

@end
