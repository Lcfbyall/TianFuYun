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


@interface ProductSearchDataSourceImpl ()

@property (nonatomic,strong)NSMutableArray *items;

@property (nonatomic,strong) UICollectionViewLayout *layout;

@property (nonatomic,strong) Class networkToolClass;

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
    

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       
           STRONG_SELF(self);
           if(self){

               //计算布局

               dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

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

    return @[@"",@"",@""];
}

- (UICollectionViewLayout *)collectionViewLayout{

    if(_layout == nil){
    
        _layout = [[ProductSearchHotLayout alloc]init];
    }

    return _layout;
}


#pragma mark - Private

- (Class)networkToolClass{

    return [ProductSearchHotNetworkTool class];
   
}

@end


#pragma mark - ProductSearchOperateResult

@implementation ProductSearchOperateResult


@end
