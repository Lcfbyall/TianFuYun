//
//  TJSDiscoNewsDataSorceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSDiscoNewsDataSorceImpl.h"

#import "DiscoveryNewsInfoModel.h"

#import "DiscoveryNewsNetworkTool.h"

@interface TJSDiscoNewsDataSorceImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@end


@implementation TJSDiscoNewsDataSorceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
    }
    
    return self;
}


#pragma mark - <TJSDiscoveryNewsListDataSource>

- (void)loadNews:(void (^)(NSArray *, NSError *))callback{
  
    WEAK_SELF(self);
    
    [DiscoveryNewsNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        STRONG_SELF(self);
        if(self){
        
        
        }
    
    } failCallback:^(id _Nullable errorInfo) {
        
        
    }];
    
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       
           STRONG_SELF(self);
           if(self){
               
               NSArray *news = @[];
               NSError *error    = nil;;
               
               if(callback){
                   
                   callback(news,error);
               }
           }
           
       });

}

//
- (NSArray *)items{
    
    if(!_items || !_items.count){
        
        _items =  [NSMutableArray arrayWithObjects:
                   
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   [DiscoveryNewsInfoModel new],
                   nil];
    }
    
    return _items;
}



@end
