//
//  TJSProductListInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListInteractorImpl.h"

@interface TJSProductListInteractorImpl ()



@end

@implementation TJSProductListInteractorImpl

- (instancetype)init{
  
    self = [super init];
    if(self){
    
        
        
    }

    return self;
}


#pragma mark - setters
//进入界面开始请求数据
- (void)setDataSource:(id<TJSProductListDataSource>)dataSource{
 
    _dataSource = dataSource;

}


#pragma mark - <NIMSessionInteractor>

- (void)loadProducts:(void (^)(NSArray* , NSError*))handler{
   
    WEAK_SELF(self);
    //找DataSource拿数据
    [self.dataSource loadProducts:^(NSArray *products, NSError *error) {
        
        STRONG_SELF(self);
        if (self) {

            if(handler){
              
                handler(products,error);
            }
        }
    }];
}

- (void)deleteProduct:(TJSProductInfoModel *)product
             callback:(void (^)(BOOL, NSError *))callback{

    WEAK_SELF(self);
    
    [self.dataSource deleteProducts:@[product] callback:^(BOOL success, NSError *error) {
       
        
        STRONG_SELF(self);
        if(self){
            
            if(callback)callback(success,error);
            
            //算出indexPath
            TJSProductListOperateResult *result = [self.dataSource deleteModel:product];
            
            [self.layout remove:(NSArray <NSIndexPath *> *)result.indexpaths];
        }
    }];
}

- (void)deleteProducts:(NSArray<TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL, NSError *))callback{

    WEAK_SELF(self);
    [self.dataSource deleteProducts:products callback:^(BOOL success, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
          
            if(callback)callback(success,error);
            
            TJSProductListOperateResult *result = [self.dataSource deleteModels:products];
            
            [self.layout remove:(NSArray <NSIndexPath *> *)result.indexpaths];

        }
        
    }];
}

- (NSArray *)items{
    
    id<TJSProductListDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}


#pragma mark - NIMSessionLayoutDelegate
//下拉刷新
- (void)onRefresh
{
    WEAK_SELF(self);
    
    [self loadProducts:^(NSArray *products, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
       
            //结束刷新
            [self.layout endRefresh];
        }
    }];
}

@end
