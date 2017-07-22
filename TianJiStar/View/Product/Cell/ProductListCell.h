//
//  ProductListCell.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableViewCell.h"

#import "TJSProductInfoModel.h"
#import "TJSProductListCellProtocol.h"

@interface ProductListCell : TJSBaseTableViewCell

@property (nonatomic, weak)   id<TJSProductListCellDelegate> delegate;

@end
