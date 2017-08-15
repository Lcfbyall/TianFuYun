//
//  ContractApplyDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyDataSourceImpl.h"

#import "ContractApplyNetworkTool.h"


@interface ContractApplyDataSourceImpl ()

@end

@implementation ContractApplyDataSourceImpl


#pragma mark - <ContractApplyDataSource>

- (void)applyContractWithParams:(id)params callback:(void (^)(id, NSError *))callback{
 
    
    [ContractApplyNetworkTool requestWithParameters:params successCallback:^(id _Nullable data) {
        
        
        
    } failCallback:^(id _Nullable error) {
        
        
        
    }];
    
    
    

}

- (void)searchProductWithKey:(NSString *)key callback:(void (^)(NSArray *, NSError *))callback{


}

- (NSArray *)items{
 
    return @[@"",@"",@""];
}


#pragma mark - Private




@end



@implementation ContractApplyOperateResult

@end



