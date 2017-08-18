//
//  BankCardListInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardListInteractorImpl.h"

@implementation BankCardListInteractorImpl

#pragma mark - <BankCardListInteractor>

- (void)loadBankCardList:(void (^)(id, NSError *))callback{
 
    [self.dataSource loadBankCardList:^(id result, NSError *error) {
        
        if(callback)callback(result,error);
        
    }];
}

- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <BankCardListLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
