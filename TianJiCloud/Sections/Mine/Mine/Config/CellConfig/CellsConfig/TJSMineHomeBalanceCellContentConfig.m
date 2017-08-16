//
//  TJSMineHomeBalanceCellContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeBalanceCellContentConfig.h"

@implementation TJSMineHomeBalanceCellContentConfig

#pragma mark - <TJSMineHomeCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{
    
    return CGSizeMake(SCREEN_WIDTH, 50);
}

- (NSString *)cellContent:(id)model{
    
    return @"MineHomeBalanceCell";
}

@end
