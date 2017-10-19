//
//  ProductFilterItemModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductFilterItem.h"


@interface ProductFilterItemModel : NSObject

@property (nonatomic,copy) NSString *type;

@property (nonatomic,strong) NSArray <ProductFilterItem *> *items;

+ (NSMutableArray *)items;

@end
