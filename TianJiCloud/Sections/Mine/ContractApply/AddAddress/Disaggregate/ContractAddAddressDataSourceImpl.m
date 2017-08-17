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



- (NSArray *)items{
    
    if(_items==nil){
    
        ContractAddAddressCellModel *add = [ContractAddAddressCellModel new];
        add.cellClass = @"ContractAddAddressAddAddressCell";
        add.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        add.selectionStyle= UITableViewCellSelectionStyleDefault;
        add.target = @"AddAdressViewController";
        add.targetParams = nil;
        WEAK_SELF(add);
        add.cellOperation = ^(id obj1, id obj2) {
            STRONG_SELF(add);
            [UIViewController tjs_pushViewController:add.target animated:YES];
        };
        
        ContractAddAddressCellModel *product = [ContractAddAddressCellModel new];
        product.cellClass = @"ContractAddAddressProductNameCell";
        product.accessoryType = UITableViewCellAccessoryNone;
        product.selectionStyle= UITableViewCellSelectionStyleNone;
        
        
        _items = [NSMutableArray arrayWithObjects:@[add],@[product], nil];
    }
    
    return _items;
}


#pragma mark - Private




@end


@implementation ContractAddAddressOperateResult

@end



