//
//  AddressManageInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageInteractorImpl.h"

@implementation AddressManageInteractorImpl

#pragma mark - <AddressManageInteractor>



- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <AddressManageLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
