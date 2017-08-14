//
//  ProductHotCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductHotCellContentConfig.h"
#import "ProductInfoSearchModel.h"


@interface ProductHotCellContentConfig ()

@end

@implementation ProductHotCellContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    return ((ProductInfoSearchModel *)model).nameSize;
}

- (NSString *)cellContent:(id)model{

   return ((ProductInfoSearchModel *)model).cellClass;
}

@end
