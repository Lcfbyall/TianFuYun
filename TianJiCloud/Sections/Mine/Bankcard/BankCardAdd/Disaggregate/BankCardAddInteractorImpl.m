//
//  BankCardAddInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddInteractorImpl.h"

@implementation BankCardAddInteractorImpl

#pragma mark - <BankCardAddInteractor>

- (void)addBankCard:(void (^)(id, NSError *))callback{
 
    [self.dataSource addBankCard:^(id result, NSError *error) {
        
        if(callback)callback(result,error);
        
    }];
}

- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <BankCardAddLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
