//
//  NSObject+Swizzle.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSObject+Swizzle.h"


@implementation NSObject (Swizzle)

void tjs_swizzleInstanceMethod(Class cls,
                           SEL originalSelector,
                           SEL swizzledSelector)
{
    
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    //class_getClassMethod
    
    BOOL didAddMethod =
    class_addMethod(cls,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod)
    {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



+ (NSArray *)allSubclasses
{
    Class myClass = [self class];
    NSMutableArray *mySubclasses = [NSMutableArray array];
    unsigned int numOfClasses;
    Class *classes = objc_copyClassList(&numOfClasses);
    for (unsigned int ci = 0; ci < numOfClasses; ci++)
    {
        Class superClass = classes[ci];
        do{
            superClass = class_getSuperclass(superClass);
        } while (superClass && superClass != myClass);
        
        if (superClass)
        {
            [mySubclasses addObject: classes[ci]];
        }
    }
    free(classes);
    return mySubclasses;
}

+ (NSArray *)getAllSubclasses
{
    Class aClass = [self class];
    
    Class *classCache = NULL;
    int numOfClasses = objc_getClassList(NULL, 0);
    NSMutableArray *classArray = [NSMutableArray array];
    if (numOfClasses > 0 )
    {
        classCache = (Class *)malloc(sizeof(Class) * numOfClasses);
        numOfClasses = objc_getClassList(classCache, numOfClasses);
        for (int i = 0; i < numOfClasses; ++i)
        {
            Class currentClass = classCache[i];
            if (currentClass)
            {
                if ([currentClass zp_isSubclassOfClass:aClass])
                {
                    //在获取含大量子类的父类的全部子类时，下面这行代码是CPU的性能瓶颈
                    [classArray addObject:currentClass];
                }
            }
        }
        free(classCache);
    }
    return [NSArray arrayWithArray:classArray];
}

- (BOOL)zp_isSubclassOfClass:(const Class)aClass
{
    Class subclass = [self class];
    
    if (!subclass || !aClass || subclass == aClass)
    {
        return NO;
    }
    Class tempClass = subclass;
    while (tempClass && tempClass != aClass)
    {
        //这里不能使用isSubclassOfClass:，因为tempClass不一定为NSObject。
        tempClass = class_getSuperclass(tempClass);
    }
    BOOL isSubclass = (tempClass == aClass);
    return isSubclass;
}


@end
