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

   [self.dataSource withDrawForFree:^(id result, NSError *error) {
       
       [UIViewController tjs_popViewControllerAnimated:YES];
       if(callback)callback(result,error);
   }];
}


- (NSArray *)items{
 
    return self.dataSource.items;
}

- (void)configWithData:(id)data{

    [self.dataSource configWithData:data];
}

- (BOOL)canCommit{
  
    return self.dataSource.canCommit;
}


#pragma mark - <WithDrawDepositLayoutDelegate>

- (void)onRefresh{

    //[self.layout reloadTable];
    
    //[self.layout endRefresh];
}

@end
