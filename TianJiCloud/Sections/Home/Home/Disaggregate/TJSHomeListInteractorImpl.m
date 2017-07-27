//
//  TJSHomeListInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSHomeListInteractorImpl.h"


@interface TJSHomeListInteractorImpl ()

@end
@implementation TJSHomeListInteractorImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        
        
    }
    
    return self;
}


#pragma mark - <TJSHomeListInteractor>

//
- (void)loadProducts:(void (^)(NSArray *products, NSError *error))callback{
    
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

- (void)deleteProducts:(NSArray <TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL success, NSError *error))callback{
}

- (void)deleteProduct:(TJSProductInfoModel *)product
             callback:(void (^)(BOOL success, NSError *error))callback{

}


//
- (NSArray *)items{

    id<TJSHomeListDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];

}

//
- (void)onViewWillAppear{


}

- (void)onViewDidDisappear{


}



#pragma mark - <TJSHomeListLayoutDelegate>

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
