//
//  ProductSearchHotCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseCollectionViewCell.h"

#import "ProductSearchHotCellProtocol.h"

@interface ProductSearchHotCell : TJSBaseCollectionViewCell

@property (nonatomic,weak)id <ProductSearchHotCellDelegate> delegate;

@end
