//
//  ContractAddAddressDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressDataSourceImpl.h"

#import "AdressEditNetworkTool.h"

#import "ContractAddAddressCellModel.h"

@interface ContractAddAddressDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation ContractAddAddressDataSourceImpl


#pragma mark - <ContractAddAddressDataSource>


- (void)saveAddress:(void (^)(id, NSError *))callback{

    [AdressEditNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        
    } failCallback:^(id _Nullable error) {
        
        
    }];
    

    if(callback)callback(nil,nil);

}

- (NSArray *)items{
    
    if(_items==nil){
    
        _items = [[ContractAddAddressCellModel configModels] mutableCopy];
    }
    
    return _items;
}


#pragma mark - Private




@end


@implementation ContractAddAddressOperateResult

@end



