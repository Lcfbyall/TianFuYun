//
//  FMDBManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FMDBManager.h"

@implementation FMDBManager

+ (void)load{


}

+ (instancetype)sharedManager {
    
    static FMDBManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}




@end
