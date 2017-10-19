//
//  ContractAddAddressInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressInteractorImpl.h"
#import "AddressPikerView.h"

@implementation ContractAddAddressInteractorImpl

#pragma mark - <ContractAddAddressInteractor>

- (void)loadAddres:(void (^)(id, NSError *))callback{

    //WEAK_SELF(self);
    [self.dataSource loadAddres:^(id result, NSError *error) {
        
        //STRONG_SELF(self);
        if(callback)callback(result,error);
        
    }];
}

- (void)saveAddress:(void (^)(id, NSError *))callback{
 
    //WEAK_SELF(self);
    [self.dataSource saveAddress:^(id result, NSError *error) {
        
        //STRONG_SELF(self);
        if(callback)callback(result,error);
        
    }];
}

- (NSArray *)items{
 
    return self.dataSource.items;
}

- (void)showRegion{

    WEAK_SELF(self);
    NSArray *regions = [self.dataSource regions];
    [AddressPikerView showWithDatas:regions
                       defaultRow:[self.dataSource regionIndex]
                             done:^(NSInteger row) {
                                 
         STRONG_SELF(self);
         [self.dataSource fillingRegion:[regions objectAtIndex:row]];
         [self.layout reloadTable];
     }];

}


#pragma mark - <ContractAddAddressLayoutDelegate>

- (void)onRefresh{
    
    WEAK_SELF(self);
    
    [self loadAddres:^(id result, NSError *error) {
        
        STRONG_SELF(self);
        
        [self.layout reloadTable];
        
        [self.layout endRefresh];
        
    }];
}

@end
