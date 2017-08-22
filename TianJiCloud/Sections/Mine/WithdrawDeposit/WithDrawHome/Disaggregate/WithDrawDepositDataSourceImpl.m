//
//  WithDrawDepositDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositDataSourceImpl.h"
#import "WithDrawDepositCellModel.h"

#import "WithDrawDepositNetworkTool.h"

@interface WithDrawDepositDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation WithDrawDepositDataSourceImpl


#pragma mark - <WithDrawDepositDataSource>

- (void)withDrawForFree:(void (^)(id, NSError *))callback{

   [WithDrawDepositNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
       
       
       
   } failCallback:^(id _Nullable error) {
       
       
       
   }];
    
    
   if(callback)callback(nil,nil);

}


- (NSArray *)items{
    
    return _items;
}

- (void)configWithData:(id)data{

    _items = [[WithDrawDepositCellModel configModelsWithInfo:data] mutableCopy];

}

- (BOOL)canCommit{
  
    //校验银行卡、输入金额
    WithDrawDepositCellModel *first = [[_items firstObject] firstObject];
    
    
    WithDrawDepositCellModel *second = [[_items lastObject] firstObject];
    

    return second.sum.length;
}


#pragma mark - Private




@end


@implementation WithDrawDepositOperateResult



@end



