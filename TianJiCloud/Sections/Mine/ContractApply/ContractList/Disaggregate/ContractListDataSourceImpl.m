//
//  ContractListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListDataSourceImpl.h"
#import "ContractListNetworkTool.h"


@interface ContractListDataSourceImpl ()

@end

@implementation ContractListDataSourceImpl


#pragma mark - <ContractListDataSource>

- (void)loadContracts:(void (^)(NSArray *, NSError *))callback{

    
    WEAK_SELF(self);
    
    [ContractListNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        
        
    } failCallback:^(id _Nullable error) {
        
        
        
    }];
    
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

- (void)deleteContracts:(NSArray<ContractInfoModel *> *)contracts callback:(void (^)(BOOL, NSError *))callback{


}

- (void)deleteContract:(ContractInfoModel *)contract callback:(void (^)(BOOL, NSError *))callback{


}

- (NSArray *)items{
 
    return @[@"",@""];
}


#pragma mark - Private




@end



@implementation ContractListOperateResult

@end



