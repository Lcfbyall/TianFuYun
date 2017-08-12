//
//  ProductSearchHotCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseCollectionViewCell.h"

@interface ProductSearchHotCell : TJSBaseCollectionViewCell

@property (nonatomic,weak)id <TJSBaseCollectionViewCellDelegate> delegate;

@property (nonatomic,strong) NSIndexPath *indexPath;

@end
