//
//  ContractApplyAddAddressContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyAddAddressContentConfig.h"

@implementation ContractApplyAddAddressContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    return CGSizeMake(SCREEN_WIDTH, 50);
}

- (NSString *)cellContent:(id)model{

    return @"ContractApplyAddAddressCell";
}

@end
