//
//  ContractListInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListInteractorImpl.h"

@implementation ContractListInteractorImpl

#pragma mark - <ContractListInteractor>

- (void)loadContracts:(void (^)(NSArray *, NSError *))callback{

}

- (void)deleteContracts:(NSArray<ContractInfoModel *> *)products callback:(void (^)(BOOL, NSError *))callback{


}

- (void)deleteContract:(ContractInfoModel *)product callback:(void (^)(BOOL, NSError *))callback{


}

- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <ContractListLayoutDelegate>

- (void)onRefresh{

    WEAK_SELF(self);
    
    [self loadContracts:^(NSArray *products, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
            
            [self .layout reloadTable];
            
            //结束刷新
            [self.layout endRefresh];
        }
    }];
}

@end
