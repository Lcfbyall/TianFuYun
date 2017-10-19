//
//  TJSProductListCellFactory.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListCellFactory.h"

#import "TJSProductListCellLayoutConfig.h"

#import "ProductListCell.h"
#import "ProductListCellHeaderView.h"
#import "TJSProductInfoModel.h"


@interface TJSProductListCellFactory ()


@end

@implementation TJSProductListCellFactory


#pragma mark - make cell

- (ProductListCell *)cellInTable:(UITableView *)tableView
             forProductInfoModel:(TJSProductInfoModel *)model{
    
    id<TJSProductCellLayoutConfig> layoutConfig =[TJSProductListCellLayoutConfig  sharedLayoutConfig];
    
    NSString *_identifier = [layoutConfig cellContent:model];
    
    ProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {

        // 目前都是一样的cell,暂用xib
        //[tableView registerClass:[ProductListCell class] forCellReuseIdentifier:_identifier];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProductListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:_identifier];

        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }

    
    return (ProductListCell *)cell;
}


#pragma mark - make headerFooterView

- (ProductListCellHeaderView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section{

    static NSString *const idendifier = @"ProductListCellHeaderView";
    
    ProductListCellHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:idendifier];
    
    if(!header){
    
        [tableView registerClass:[ProductListCellHeaderView class] forHeaderFooterViewReuseIdentifier:idendifier];
        
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:idendifier];
    }
    
    return header;
}

@end
