//
//  TJSMyOrderListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListDataSourceImpl.h"

#import "MyOrderInfoModel.h"
//#import "ProductListNetworkTool.h"
//#import "ProductDeleteNetworkTool.h"


@interface TJSMyOrderListDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;


@end

@implementation TJSMyOrderListDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];
    }
    
    return self;
}



#pragma mark - <TJSMyOrderListDataSource>

- (void)loadOrders:(void (^)(NSArray *, NSError *))callback{

    WEAK_SELF(self);
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


- (NSArray *)items{

    return @[@"",@"",@"",@""];
}

@end


@implementation TJSMyOrderListOperateResult

@end
