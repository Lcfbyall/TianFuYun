//
//  NSObject+Swizzle.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (Swizzle)

void tjs_swizzleInstanceMethod(Class cls,
                           SEL originalSelector,
                           SEL swizzledSelector);

+ (NSArray *)allSubclasses;

@end
