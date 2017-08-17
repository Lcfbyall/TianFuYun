//
//  ContractAddAddressInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressInteractorImpl.h"

@implementation ContractAddAddressInteractorImpl

#pragma mark - <ContractAddAddressInteractor>



- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <ContractAddAddressLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
