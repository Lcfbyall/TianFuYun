//
//  AddressSelectedInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectedInteractorImpl.h"

@implementation AddressSelectedInteractorImpl

#pragma mark - <AddressSelectedInteractor>



- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <AddressSelectedLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
