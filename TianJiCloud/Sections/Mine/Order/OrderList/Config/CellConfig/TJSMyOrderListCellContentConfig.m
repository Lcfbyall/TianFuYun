//
//  TJSMyOrderListCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListCellContentConfig.h"

@implementation TJSMyOrderListCellContentConfig

#pragma mark - <TJSMyOrderListCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    return CGSizeMake(cellWidth, 180);
}

- (NSString *)cellContent:(id)model{

   return @"MyOrderListTableCell";
}

@end
