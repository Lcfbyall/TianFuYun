//
//  ProductListCell.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableViewCell.h"

#import "TJSProductListCellProtocol.h"

@class ProductListCellContentView;

@interface ProductListCell : TJSBaseTableViewCell


@property (nonatomic, strong) ProductListCellContentView *contentview; //内容区域

@property (nonatomic, weak)   id<TJSProductListCellDelegate> delegate;

@end
