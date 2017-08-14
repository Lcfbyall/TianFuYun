//
//  ProductSearchDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchDataSourceImpl.h"



#import "ProductSearchHotLayout.h"
#import "ProductSearchResultLayout.h"
#import "ProductSearchHotNetworkTool.h"
#import "ProductSearchNetworkTool.h"

#import "ProductInfoSearchModel.h"

@interface ProductSearchDataSourceImpl ()

@property (nonatomic,strong) NSArray *products;
@property (nonatomic,strong) NSMutableArray *hotItems;
@property (nonatomic,strong) NSMutableArray *resultItems;


@property (nonatomic,strong) UICollectionViewLayout *layout;

@end

@implementation ProductSearchDataSourceImpl


- (instancetype)init{
  
    self = [super init];
    if(self){
    
        
    }
    
    return self;
}

#pragma mark - <ProductSearchDataSource>

- (void)search:(void (^)(NSArray *products, NSError *error))callback{

    WEAK_SELF(self);
    
    if([self.layout isKindOfClass:[ProductSearchHotLayout class]]){
    
        [ProductSearchHotNetworkTool requestWithParameters:@{} successCallback:^(id _Nullable data) {
            
            
        } failCallback:^(id _Nullable error) {
            
            
            
        }];
    
    }else{
    
      
        [ProductSearchNetworkTool requestWithParameters:@{} successCallback:^(id _Nullable data) {
            
            
        } failCallback:^(id _Nullable error) {
            
            
            
        }];
    
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       
           STRONG_SELF(self);
           if(self){

               //计算布局

               dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

                   
                   if([self.layout isKindOfClass:[ProductSearchHotLayout class]]){
                       
                       NSArray *hotprodutcs = @[
                                             [TJSProductInfo new],
                                             
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             ];
                       _products = hotprodutcs;
                       
                       __block NSMutableArray *hots = [NSMutableArray array];
                       [hotprodutcs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                           
                           TJSProductInfo *info = (TJSProductInfo *)obj;
                           info.name = @"中能源农宝一号私募基金";
                           
                           ProductInfoSearchModel *model = [[ProductInfoSearchModel alloc]initWithProduct:obj];
                           
                           model.cellClass = @"ProductSearchHotCell";
                           
                           [hots addObject:model];
                       }];
                       
                       _hotItems = hots;
                       
                   }else{
                       
                       NSArray *resultprodutcs = @[
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             [TJSProductInfo new],
                                             ];
                       _products = resultprodutcs;
                       
                       __block NSMutableArray *results = [NSMutableArray array];
                       [resultprodutcs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                           
                           TJSProductInfo *info = (TJSProductInfo *)obj;
                           info.name = @"中能源农宝一号私募基金";
                           ProductInfoSearchModel *model = [[ProductInfoSearchModel alloc]initWithProduct:obj];
                           
                           model.cellClass = @"ProductSearchResultCell";
                           
                           [results addObject:model];
                       }];
                       
                       _resultItems = results;
                   }
                   
                   
                   [(TJSBaseCollectionViewLayout *)self.layout calculateLayoutAttributes];
    
                   
                   dispatch_async(dispatch_get_main_queue(), ^{

                       NSArray *products = @[];
                       
                       NSError *error    = nil;;

                       if(callback){

                           callback(products,error);
                       }
                   });

               });
           }
           
       });


}

- (NSArray *)items{

    if([self.layout isKindOfClass:[ProductSearchHotLayout class]]){
        
        return _hotItems;
        
    }else{
    
        return _resultItems;
    }
    
    return @[];
}

- (UICollectionViewLayout *)collectionViewLayout{

    if(_layout == nil){
    
        _layout = [[ProductSearchHotLayout alloc]init];
    }

    return _layout;
}


@end


#pragma mark - ProductSearchOperateResult

@implementation ProductSearchOperateResult


@end
