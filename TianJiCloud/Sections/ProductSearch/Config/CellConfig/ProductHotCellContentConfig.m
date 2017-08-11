//
//  ProductHotCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductHotCellContentConfig.h"

@implementation ProductHotCellContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    return CGSizeMake(100, 40);
}

- (NSString *)cellContent:(id)model{

   return @"ProductSearchHotCell";
}

@end
