//
//  TJSDiscoNewsInteracotImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSDiscoNewsInteracotImpl.h"



@implementation TJSDiscoNewsInteracotImpl

#pragma mark - <TJSDiscoveryNewsListInteractor>

- (void)loadNews:(void (^)(NSArray *, NSError *))callback{
   
    WEAK_SELF(self);
    [self.dataSource loadNews:^(NSArray *news, NSError *error) {
        
        STRONG_SELF(self);
        if (self) {
            
            if(callback){
                
                callback(news,error);
            }
        }
    }];
}

- (NSArray *)items{
    
    id<TJSDiscoveryNewsListDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}


#pragma mark - <TJSDiscoNewsLayoutDelegate>

- (void)onRefresh
{
    WEAK_SELF(self);
    
    [self loadNews:^(NSArray *news, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
            
            [self.layout reloadTable];
            
            //结束刷新
            [self.layout endRefresh];
        }
    }];

}


@end
