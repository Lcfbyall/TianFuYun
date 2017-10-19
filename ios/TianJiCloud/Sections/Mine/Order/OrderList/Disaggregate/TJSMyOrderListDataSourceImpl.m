//
//  TJSMyOrderListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListDataSourceImpl.h"
#import "OrderListNetworkTool.h"
#import "MyOrderInfoModel.h"


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

    [OrderListNetworkTool requestWithParameters:nil successCallback:^(id _Nullable result) {
        
        
    } failCallback:^(id _Nullable error) {
        
        
        
    }];
    

    NSArray *orders = [MyOrderInfo defaultOrders];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        _items = [[MyOrderInfoModel configWithOrderInfos:orders] mutableCopy];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(self){
                
                NSArray *products = _items;
                NSError *error    = nil;;
                
                if(callback){
                    
                    callback(products,error);
                }
            }
        });
        
    });

}


- (NSArray *)items{

    return _items;
}

@end


@implementation TJSMyOrderListOperateResult

@end
