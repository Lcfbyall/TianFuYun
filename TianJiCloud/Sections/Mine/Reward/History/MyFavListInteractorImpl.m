//
//  MyFavListInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavListInteractorImpl.h"

@interface MyFavListInteractorImpl ()

@end

@implementation MyFavListInteractorImpl


#pragma mark - <TJSProductListInteractor>

- (void)loadProducts:(void (^)(NSArray* , NSError*))callback{
    
    WEAK_SELF(self);
    //找DataSource拿数据
    [self.dataSource loadProducts:^(NSArray *products, NSError *error) {
        
        STRONG_SELF(self);
        if (self) {
            
            if(callback){
                
                callback(products,error);
            }
        }
    }];
}

- (void)deleteProduct:(TJSProductInfoModel *)product
             callback:(void (^)(BOOL, NSError *))callback{
    
    WEAK_SELF(self);
    
    [self.dataSource deleteProducts:@[product] callback:^(BOOL success, NSError *error) {
        
        if(callback){
        
            STRONG_SELF(self);
            if(self){
                
                if(callback)callback(success,error);
                
                //算出indexPath
                MyFavListOperateResult *result = [self.dataSource deleteModel:product];
                
                [self.layout remove:(NSArray <NSIndexPath *> *)result.indexpaths];
            }
        }
    }];
    
    if(callback==NULL){
    
        //算出indexPath
        MyFavListOperateResult *result = [self.dataSource deleteModel:product];
        
        [self.layout remove:(NSArray <NSIndexPath *> *)result.indexpaths];
    }
}

- (void)deleteProducts:(NSArray<TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL, NSError *))callback{
    
    WEAK_SELF(self);
    [self.dataSource deleteProducts:products callback:^(BOOL success, NSError *error) {
        
        STRONG_SELF(self);
        if(callback){
            if(self){
                
                if(callback)callback(success,error);
                
                MyFavListOperateResult *result = [self.dataSource deleteModels:products];
                
                [self.layout remove:(NSArray <NSIndexPath *> *)result.indexpaths];
                
            }
        }
        
    }];
    
    
    if(callback==NULL){
      
        MyFavListOperateResult *result = [self.dataSource deleteModels:products];
        
        [self.layout remove:(NSArray <NSIndexPath *> *)result.indexpaths];
        
    }
}

- (NSArray *)items{
    
    id<MyFavListDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}


#pragma mark - TJSProductListLayoutDelegate
//下拉刷新
- (void)onRefresh
{
    WEAK_SELF(self);
    
    [self loadProducts:^(NSArray *products, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
            
            [self .layout reloadTable];
            
            //结束刷新
            [self.layout endRefresh];
        }
    }];
}


@end
