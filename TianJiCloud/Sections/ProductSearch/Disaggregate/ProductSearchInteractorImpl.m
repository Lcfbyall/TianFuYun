//
//  ProductSearchInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchInteractorImpl.h"



@implementation ProductSearchInteractorImpl


#pragma mark - <ProductSerachInteractor>

- (void)search:(void (^)(NSArray *products, NSError *error))callback{

    //WEAK_SELF(self);
    [self.dataSource search:^(NSArray *products, NSError *error) {
        
        //STRONG_SELF(self);
        
        if(callback)callback(products,error);
    }];
}

- (NSArray *)items{

   return  [self.dataSource items];
}

- (UICollectionViewLayout *)collectionViewLayout{
  
    return self.dataSource.collectionViewLayout;
}


#pragma mark - <ProductSearchLayoutDelegate>

- (void)onRefresh{

    WEAK_SELF(self);
   [self search:^(NSArray *products, NSError *error) {
       
       STRONG_SELF(self);
       if(self){
           
           [self .layout reloadCollect];
           
           //结束刷新
           [self.layout endRefresh];
       }
   }];
}

@end


