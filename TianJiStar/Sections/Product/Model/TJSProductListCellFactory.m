//
//  TJSProductListCellFactory.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListCellFactory.h"

#import "TJSProductListCellLayoutConfig.h"

#import "ProductListCell.h"
#import "TJSProductInfoModel.h"


@interface TJSProductListCellFactory ()


@end

@implementation TJSProductListCellFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)dealloc
{
    
}

- (ProductListCell *)cellInTable:(UITableView *)tableView
             forProductInfoModel:(TJSProductInfoModel *)model{
    
    id<TJSProductCellLayoutConfig> layoutConfig =[TJSProductListCellLayoutConfig  sharedLayoutConfig];
    
    NSString *_identifier = [layoutConfig cellContent:model];
    
    ProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {

        
        [tableView registerClass:[ProductListCell class] forCellReuseIdentifier:_identifier];
    

        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    
    [cell tjs_bindDataToCellWithValue:model];
    
    
    return (ProductListCell *)cell;
}

@end
