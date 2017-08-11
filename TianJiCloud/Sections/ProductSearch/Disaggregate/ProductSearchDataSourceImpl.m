//
//  ProductSearchDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchDataSourceImpl.h"


@interface ProductSearchDataSourceImpl ()

@property (nonatomic,strong)NSMutableArray *items;


@end

@implementation ProductSearchDataSourceImpl




#pragma mark - <ProductSearchDataSource>

- (NSArray *)items{

    return @[@"",@"",@""];
}




@end


#pragma mark - ProductSearchOperateResult

@implementation ProductSearchOperateResult


@end
