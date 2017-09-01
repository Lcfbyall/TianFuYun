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
#import "DiscoveryNewsCollectLayout.h"


@interface TJSDiscoNewsDataSorceImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic,strong) UICollectionViewLayout *layout;


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
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       
           //计算布局
           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
               
               [self p_fetchData];
           
               [(TJSBaseCollectionViewLayout *)self.layout calculateLayoutAttributes];
               
               dispatch_async(dispatch_get_main_queue(), ^{
               
                   STRONG_SELF(self);
                   if(self){
                       
                       NSArray *news = @[];
                       NSError *error    = nil;;
                       
                       if(callback){
                           
                           callback(news,error);
                       }
                   }
               
               });
           
           });
    
       });

}


- (void)p_fetchData {
    
    NSMutableArray *infos = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"videoData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *videoList = [rootDict objectForKey:@"videoList"];
    NSInteger originIndex = arc4random_uniform(10);
    NSInteger maxIndex = originIndex + arc4random_uniform(15) + 5;
    for (NSInteger index = originIndex; index < maxIndex; index ++ ) {
        
        NSDictionary *dataDic = videoList[index];
        DiscoveryNewsInfo *model = [DiscoveryNewsInfo yy_modelWithJSON:dataDic];
        
        [infos addObject:model];
    }
    
    _items = [DiscoveryNewsInfoModel configModelWithNewsInfos:infos];
}


//
- (NSArray *)items{
    
    return _items;
}

- (UICollectionViewLayout *)collectionViewLayout{
    
    if(_layout == nil){
        
        _layout = [[DiscoveryNewsCollectLayout alloc]init];
    }
    
    return _layout;
}


@end
