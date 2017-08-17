//
//  ContractApplyDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyDataSourceImpl.h"

#import "ContractApplyNetworkTool.h"
#import "ContractInfoApplyModel.h"

@interface ContractApplyDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation ContractApplyDataSourceImpl


#pragma mark - <ContractApplyDataSource>

- (void)applyContractWithParams:(id)params
   callback:(void (^)(id, NSError *))callback{
 
    
    [ContractApplyNetworkTool requestWithParameters:params successCallback:^(id _Nullable data) {
        
    
        
    } failCallback:^(id _Nullable error) {
        

    }];
    
    NSError *error = nil;
    if(callback)callback(nil,error);
    
}

- (void)searchProductWithKey:(NSString *)key
  callback:(void (^)(NSArray *, NSError *))callback{


}

- (NSArray *)items{
    
    if(_items==nil){
    
    
        _items = [[ContractInfoApplyModel configModels] mutableCopy];;
        
    }
    
    return _items;
}


#pragma mark - Private




@end



@implementation ContractApplyOperateResult

@end



