//
//  ProductSearchCellContentConfigFactory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TJSBaseCellContentConfigProtocol.h"

@class ProductInfoSearchModel;

@interface ProductSearchCellContentConfigFactory : NSObject

- (NSArray *)allCells;

- (id<TJSBaseCellContentConfig>)configBy:(ProductInfoSearchModel *)model;


@end
