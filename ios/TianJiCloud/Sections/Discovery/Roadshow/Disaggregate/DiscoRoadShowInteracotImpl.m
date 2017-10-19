//
//  DiscoRoadShowInteracotImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowInteracotImpl.h"



@implementation DiscoRoadShowInteracotImpl

#pragma mark - <TJSDiscoveryNewsListInteractor>

- (void)loadRoadShow:(void (^)(NSArray *, NSError *))callback{
   
    WEAK_SELF(self);
    [self.dataSource loadRoadShow:^(NSArray *shows, NSError *error) {
        
        STRONG_SELF(self);
        if (self) {
            
            if(callback){
                
                callback(shows,error);
            }
        }
    }];
}

- (NSArray *)items{
    
    id<DiscoRoadShowListDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}

- (UICollectionViewLayout *)collectionViewLayout{
 
    return self.dataSource.collectionViewLayout;
}


#pragma mark - <DiscoRoadShowLayoutDelegate>

- (void)onRefresh
{
    WEAK_SELF(self);
    
    [self loadRoadShow:^(NSArray *shows, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
            
            [self.layout reloadTable];
            
            //结束刷新
            [self.layout endRefresh];
        }
    }];

}


@end
