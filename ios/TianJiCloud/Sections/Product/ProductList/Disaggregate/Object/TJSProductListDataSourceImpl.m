//
//  TJSProductListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListDataSourceImpl.h"
#import "TJSProductInfoModel.h"

#import "ProductListNetworkTool.h"
#import "ProductDeleteNetworkTool.h"

@interface TJSProductListDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation TJSProductListDataSourceImpl


- (instancetype)init{

    self = [super init];
    if(self){
    
        _items = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - <TJSProductListDataSource>

- (void)loadProducts:(void (^)(NSArray *products, NSError *error))callback{
    
    WEAK_SELF(self);
    
    [ProductListNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        STRONG_SELF(self);
        if(self){
          
            [self p_resetProductModels:data];
            
        }
        
    } failCallback:^(id _Nullable errorInfo) {
        
    
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        
        STRONG_SELF(self);
        if(self){
            
            NSArray *products = @[];
            NSError *error    = nil;;
           
            if(callback){
                
                callback(products,error);
            }
        }
                       
    });
    
}

- (void)deleteProducts:(NSArray<TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL, NSError *))callback{

    WEAK_SELF(self);
    [ProductDeleteNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        
        
    } failCallback:^(id _Nullable errorInfo) {
        
        
        
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       
       STRONG_SELF(self);
       if(self){
        
           NSError *error    = nil;;
           
           if(callback){
               
               callback(YES,error);
           }
       }
   });
    
}

- (NSArray *)items{
    
    if(!_items || !_items.count){
    
        _items =  [NSMutableArray arrayWithObjects:
                   
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   nil];
    }
    
    return _items;
}


- (TJSProductListOperateResult *)deleteModel:(TJSProductInfoModel *)model{


    NSArray <NSNumber *> *indexs =  nil;
    
    NSMutableArray *dels    = [NSMutableArray array];
    NSUInteger delMsgIndex   = [self.items indexOfObject:model];
    
    if(delMsgIndex == NSNotFound){
       
        TJSProductListOperateResult *result = [[TJSProductListOperateResult alloc] init];
        result.indexpaths          = @[];
        result.productInfoModels   = @[];
        
        return  result;
    }
    
    [self.items removeObject:model];
    [dels addObject:@(delMsgIndex)];
    indexs = dels;
    
    
    TJSProductListOperateResult *result = [[TJSProductListOperateResult alloc] init];
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSNumber *index in indexs) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index.integerValue inSection:0];
        [indexPaths addObject:indexPath];
    }
    
    result.indexpaths          = indexPaths;
    result.productInfoModels   = @[model];
    
    return result;

}

- (TJSProductListOperateResult *)deleteModels:(NSArray<TJSProductInfoModel *> *)models{


    NSIndexSet *delMsgIndexSet = [self.items indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        if([obj isKindOfClass:[TJSProductInfoModel class]]){
           
            return YES;
        }
        return NO;
    }];
    
    [self.items removeObjectsAtIndexes:delMsgIndexSet];
    
    TJSProductListOperateResult *result = [[TJSProductListOperateResult alloc] init];
    
    NSMutableArray *indexPaths = [NSMutableArray array];
    [delMsgIndexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
        [indexPaths addObject:indexPath];
        
    }];
    
    result.indexpaths          = indexPaths;
    
    result.productInfoModels   = models;
    
    return result;

}




#pragma mark - private methods

- (NSArray <TJSProductInfoModel *> *)p_modelsWithProducts:(NSArray<TJSProductInfo *> *)products{

    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (TJSProductInfo *product in products) {
        
        TJSProductInfoModel *model = [[TJSProductInfoModel alloc] initWithProduct:product];
        
        [array addObject:model];
    }
    return array;
}

//刷新，重置
- (void)p_resetProductModels:(NSArray <TJSProductInfo *> *)models{
  
    if (!models.count) {
        
        return;
    }
    
    self.items = [NSMutableArray array];
    
    [self p_appendProductModels:[self p_modelsWithProducts:models]];
    
}

//从后插入
- (void)p_appendProductModels:(NSArray <TJSProductInfoModel *>  *)models{

    if (!models.count) {
        
        return;
    }
    
    [self.items addObjectsFromArray:models];
    
}

- (void)p_deleteProductModels:(NSArray <TJSProductInfoModel *>  *)models{



}


@end




@implementation TJSProductListOperateResult

@end




