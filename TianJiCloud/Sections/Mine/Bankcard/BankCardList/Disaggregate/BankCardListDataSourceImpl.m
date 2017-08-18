//
//  BankCardListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardListDataSourceImpl.h"
#import "BankCardInfoModel.h"
#import "BankCardListNetworkTool.h"

@interface BankCardListDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation BankCardListDataSourceImpl


#pragma mark - <BankCardListDataSource>

- (void)loadBankCardList:(void (^)(id, NSError *))callback{

   [BankCardListNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
       
       
       
   } failCallback:^(id _Nullable error) {
       
       
       
   }];
    

    if(callback)callback(nil,nil);

}

- (NSArray *)items{
    
    if(_items==nil){
    
        _items = [[BankCardInfoModel configModels] mutableCopy];
    }
    
    return _items;
}


#pragma mark - Private




@end


@implementation BankCardListOperateResult

@end



