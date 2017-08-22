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


}

- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <CumulativeInvestLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
