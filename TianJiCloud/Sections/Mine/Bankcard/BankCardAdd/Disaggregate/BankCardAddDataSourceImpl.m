//
//  BankCardAddDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddDataSourceImpl.h"
#import "BankCardInfoModel.h"

#import "BankCardAddNetworkTool.h"

@interface BankCardAddDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation BankCardAddDataSourceImpl


#pragma mark - <BankCardAddDataSource>

- (void)addBankCard:(void (^)(id, NSError *))callback{

   [BankCardAddNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
       
       
       
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


@implementation BankCardAddOperateResult

@end



