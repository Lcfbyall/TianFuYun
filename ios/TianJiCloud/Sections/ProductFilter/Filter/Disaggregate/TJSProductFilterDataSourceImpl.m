//
//  TJSProductFilterDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterDataSourceImpl.h"
#import "ProductFilterNetworkTool.h"
#import "ProductFilterCollLayout.h"
#import "ProductFilterItemModel.h"

@interface TJSProductFilterDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic,strong)ProductFilterCollLayout *layout;

@end

@implementation TJSProductFilterDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];

    }
    
    return self;
}


#pragma mark - <ProductFilterDataSource>

- (void)loadFilterParamas:(void (^)(NSArray *paramas, NSError *error))callback{

    WEAK_SELF(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       
       STRONG_SELF(self);
       if(self){
           
           
           //计算布局
           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
               
               
               [self.layout calculateLayoutAttributes];
               
               dispatch_async(dispatch_get_main_queue(), ^{
                   
                   NSError *error = nil;;
                   
                   if(callback){
                       
                       callback(nil,error);
                   }
               });
           });
           
       }
   });

}

- (NSArray *)items{

    if(!_items || !_items.count){
    
        _items = [ProductFilterItemModel items];
        
    }
  
    return _items;
}

- (NSArray *)filterParamas{

    return @[];
}

- (void)resetFilterParamas{


}

- (UICollectionViewLayout *)collectionViewLayout{

    if(_layout==nil){
        
      _layout = [[ProductFilterCollLayout alloc]init];
    }
    
    return _layout;
}

@end



#pragma mark - ProductFilterOperateResult

@implementation ProductFilterOperateResult


@end

