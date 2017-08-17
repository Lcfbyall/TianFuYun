//
//  AddressManageDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageDataSourceImpl.h"

#import "AdressManageNetworkTool.h"

#import "AddressManageCellModel.h"

@interface AddressManageDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation AddressManageDataSourceImpl


#pragma mark - <AddressManageDataSource>


- (NSArray *)items{
    
    if(_items==nil){
    
        AddressManageCellModel *add = [AddressManageCellModel new];
        add.cellClass = @"AddressManageDefaultCell";
        
        AddressManageCellModel *product = [AddressManageCellModel new];
        product.cellClass = @"AddressManageDefaultCell";
    
        
        _items = [NSMutableArray arrayWithObjects:@[add],@[product], nil];
    }
    
    return _items;
}


#pragma mark - Private




@end



@implementation AddressManageOperateResult

@end



