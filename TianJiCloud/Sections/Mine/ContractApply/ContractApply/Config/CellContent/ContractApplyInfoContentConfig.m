//
//  ContractApplyInfoContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyInfoContentConfig.h"

@implementation ContractApplyInfoContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{
    
    return CGSizeMake(SCREEN_WIDTH, 100);
}

- (NSString *)cellContent:(id)model{
    
    static NSString *const identifier = @"ContractApplyInfoCell";
    
    return identifier;
}


@end
