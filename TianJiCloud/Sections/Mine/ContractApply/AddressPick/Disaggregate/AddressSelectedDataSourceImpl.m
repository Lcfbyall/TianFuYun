//
//  AddressSelectedDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectedDataSourceImpl.h"

#import "AdressManageNetworkTool.h"

#import "AddressSelectedModel.h"

@interface AddressSelectedDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation AddressSelectedDataSourceImpl


#pragma mark - <AddressSelectedDataSource>


- (NSArray *)items{
    
    if(_items==nil){
    
        AddressSelectedModel *add = [AddressSelectedModel new];
        add.cellClass = @"AddressSelectedDefaultCell";
   
        
        AddressSelectedModel *product = [AddressSelectedModel new];
        product.cellClass = @"AddressSelectedDefaultCell";
    
        _items = [NSMutableArray arrayWithObjects:add,product, nil];
    }
    
    return _items;
}


#pragma mark - Private




@end



@implementation AddressSelectedOperateResult

@end



