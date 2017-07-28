//
//  TJSDiscoNewsInteracotImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSDiscoNewsInteracotImpl.h"



@implementation TJSDiscoNewsInteracotImpl

#pragma mark - <TJSDiscoveryNewsListInteractor>

- (void)loadNews:(void (^)(NSArray *, NSError *))callback{
   
    
    [self.dataSource loadNews:^(NSArray *news, NSError *error) {
        
        
        
    }];
}






@end
