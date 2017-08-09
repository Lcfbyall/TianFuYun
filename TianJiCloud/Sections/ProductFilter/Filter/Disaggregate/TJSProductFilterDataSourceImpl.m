//
//  TJSProductFilterDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterDataSourceImpl.h"
#import "ProductFilterNetworkTool.h"

#import "ProductFilterItemModel.h"

@interface TJSProductFilterDataSourceImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation TJSProductFilterDataSourceImpl

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _items = [NSMutableArray array];

    }
    
    return self;
}


#pragma mark - <ProductFilterDataSource>

- (NSArray *)items{

    if(!_items || !_items.count){
    
        _items = [ProductFilterItemModel items];
        
    }
  
    return _items;
}


@end



#pragma mark - ProductFilterOperateResult

@implementation ProductFilterOperateResult


@end

