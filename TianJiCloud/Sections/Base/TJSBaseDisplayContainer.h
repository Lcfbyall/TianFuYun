//
//  TJSBaseDisplayContainer.h
//  TianJiCloud
//
//  Created by staff on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "YZDisplayViewController.h"

@protocol TJSBaseDisplayContainerProtocol <NSObject>

@required

- (void)tjs_setupChildViewControllers;

@end



@interface TJSBaseDisplayContainer : YZDisplayViewController<TJSBaseDisplayContainerProtocol>

@end
