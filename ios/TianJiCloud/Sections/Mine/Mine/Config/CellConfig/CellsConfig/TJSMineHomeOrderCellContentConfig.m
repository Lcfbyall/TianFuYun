//
//  TJSMineHomeOrderCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeOrderCellContentConfig.h"

@implementation TJSMineHomeOrderCellContentConfig

#pragma mark - <TJSMineHomeCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{
    
    return CGSizeMake(SCREEN_WIDTH, 120);
}

- (NSString *)cellContent:(id)model{
    
    static NSString *const identifier = @"MineHomeOrderCell";
    
    return identifier;

}


@end
