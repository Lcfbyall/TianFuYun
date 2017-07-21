//
//  UIViewController+RouteParams.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIViewController+RouteParams.h"
#import <objc/runtime.h>

@implementation UIViewController (RouteParams)

- (void)setParams:(NSDictionary *)params {
    
    objc_setAssociatedObject(self, @selector(params), params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)params {
    return objc_getAssociatedObject(self, _cmd);
}

@end
