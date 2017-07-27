//
//  TJSHomeListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSHomeListDataSourceImpl.h"
#import "TJSProductListDataSourceImpl.h"

#import "TJSProductInfoModel.h"

@interface TJSHomeListDataSourceImpl ()

@property (nonatomic,strong)TJSProductListDataSourceImpl *productDatasourceImpl;

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation TJSHomeListDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
        
        _productDatasourceImpl = [[TJSProductListDataSourceImpl alloc]init];
    }
    
    return self;
}



///在这里，首页需要产品cell数据，就去 TJSProductListDataSourceImpl 去找。

#pragma mark - <TJSProductListDataSource>

- (void)loadProducts:(void (^)(NSArray *, NSError *))callback{
  
     WEAK_SELF(self);
    [_productDatasourceImpl loadProducts:^(NSArray *products, NSError *error) {
        
        STRONG_SELF(self);
        if (self) {
            
            if(callback){
                
                callback(products,error);
            }
        }
        
    }];
  
}

- (NSArray *)items{
    
    if(!_items || !_items.count){
        
        _items =  [NSMutableArray arrayWithObjects:
                   
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new],
                   [TJSProductInfoModel new], nil];
    }
    
    return _items;
}


#pragma mark - private methods






@end
