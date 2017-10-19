//
//  TJSMyOrderListInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListInteractorImpl.h"

@implementation TJSMyOrderListInteractorImpl


#pragma mark - <TJSMyOrderListInteractor>

- (void)loadOrders:(void (^)(NSArray *, NSError *))callback{

    
    WEAK_SELF(self);
   [self.dataSource loadOrders:^(NSArray *orders, NSError *error) {
       
       STRONG_SELF(self);
       if (self) {
           
           if(callback){
               
               callback(orders,error);
           }
       }
       
   }];
    
}

- (NSArray *)items{
  
    
    return [self.dataSource items];
}


- (void)onViewWillAppear{


}


- (void)onViewDidDisappear{


}


#pragma mark - <TJSMyOrderListLayoutDelegate>

- (void)onRefresh{
 
    WEAK_SELF(self);
    [self loadOrders:^(NSArray *orders, NSError *error) {
        
        STRONG_SELF(self);
        
        [self.layout reloadTable];
        
        [self.layout endRefresh];
        
    }];

}



@end
