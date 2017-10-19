//
//  TJSProductListCellFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProductListCell;
@class ProductListCellHeaderView;
@class TJSProductInfoModel;

@interface TJSProductListCellFactory : NSObject

- (ProductListCell *)cellInTable:(UITableView*)tableView
             forProductInfoModel:(TJSProductInfoModel *)model;

- (ProductListCellHeaderView *)headerFooterViewIntable:(UITableView *)tableView forSection:(NSInteger)section;

@end
