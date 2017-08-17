//
//  ConAddressMiddleLabelContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ConAddressMiddleLabelContentConfig.h"

@implementation ConAddressMiddleLabelContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{
    
    return CGSizeMake(cellWidth, 50);
}


- (NSString *)cellContent:(id)model{
    
    static NSString *const identifier = @"ConAddressMiddleLabelCell";
    
    return identifier;
}


@end
