//
//  ContractApplyInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyInteractorImpl.h"

@implementation ContractApplyInteractorImpl

#pragma mark - <ContractApplyInteractor>

- (void)applyContractWithParams:(id)params callback:(void (^)(id, NSError *))callback;{
 
    [self.dataSource applyContractWithParams:params callback:^(id data, NSError * error) {
        
        
        
    }];
}

- (void)searchProductWithKey:(NSString *)key callback:(void (^)(NSArray *, NSError *))callback;{
 
    [self.dataSource searchProductWithKey:key callback:^(NSArray *products, NSError *error) {
        
        
    }];

}

- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <ContractApplyLayoutDelegate>

- (void)onRefresh{

  [self .layout reloadTable];
    
}

@end
