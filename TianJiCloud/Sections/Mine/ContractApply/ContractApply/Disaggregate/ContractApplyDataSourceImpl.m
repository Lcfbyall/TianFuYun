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
    
        ContractInfoApplyModel *add = [ContractInfoApplyModel new];
        add.cellClass = @"ContractApplyAddAddressCell";
        add.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        add.selectionStyle= UITableViewCellSelectionStyleDefault;
        add.target = @"AddAdressViewController";
        add.targetParams = nil;
        WEAK_SELF(add);
        add.cellOperation = ^(id obj1, id obj2) {
            STRONG_SELF(add);
            [UIViewController tjs_pushViewController:add.target animated:YES];
        };
        
        ContractInfoApplyModel *product = [ContractInfoApplyModel new];
        product.cellClass = @"ContractApplyProductNameCell";
        product.accessoryType = UITableViewCellAccessoryNone;
        product.selectionStyle= UITableViewCellSelectionStyleNone;
        
        
        _items = [NSMutableArray arrayWithObjects:@[add],@[product], nil];
    }
    
    return _items;
}


#pragma mark - Private




@end



@implementation ContractApplyOperateResult

@end



