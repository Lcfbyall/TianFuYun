//
//  CumulativeInvestInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestInteractorImpl.h"

@implementation CumulativeInvestInteractorImpl

#pragma mark - <CumulativeInvestInteractor>

- (void)loadInvest:(void (^)(id, NSError *))callback{

      [self.dataSource loadInvest:^(id result, NSError *error) {
          
          if(callback)callback(result,error);
      }];
}

- (NSArray *)items{
 
    return self.dataSource.items;
}

- (NSString *)totalInvest{
  
    return self.dataSource.totalInvest;
}


#pragma mark - <CumulativeInvestLayoutDelegate>

- (void)onRefresh{
    
    WEAK_SELF(self);
    [self loadInvest:^(id result, NSError *error) {
        
        STRONG_SELF(self);
        
        [self.layout reloadTable];
        
        [self.layout endRefresh];
        
    }];

}

@end
