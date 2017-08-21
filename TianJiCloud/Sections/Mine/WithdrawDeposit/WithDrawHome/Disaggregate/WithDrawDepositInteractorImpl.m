//
//  WithDrawDepositInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositInteractorImpl.h"
#import "BankPickerView.h"

@implementation WithDrawDepositInteractorImpl

#pragma mark - <WithDrawDepositInteractor>

- (void)withDrawForFree:(void (^)(id, NSError *))callback{


}


- (NSArray *)items{
 
    return self.dataSource.items;
}

- (void)configWithData:(id)data{

    [self.dataSource configWithData:data];
}


#pragma mark - <WithDrawDepositLayoutDelegate>

- (void)onRefresh{

    //[self.layout reloadTable];
    
    //[self.layout endRefresh];
}

@end
