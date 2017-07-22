//
//  TJSProductListCellFactory.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductListCell.h"

@interface TJSProductListCellFactory : NSObject


- (ProductListCell *)cellInTable:(UITableView*)tableView
             forProductInfoModel:(TJSProductInfoModel *)model;

@end
