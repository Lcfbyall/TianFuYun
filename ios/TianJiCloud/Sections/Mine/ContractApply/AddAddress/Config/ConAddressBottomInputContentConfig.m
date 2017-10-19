//
//  ConAddressBottomInputContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ConAddressBottomInputContentConfig.h"

@implementation ConAddressBottomInputContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{
    
    return CGSizeMake(cellWidth, 80);
    
}

- (NSString *)cellContent:(id)model{
    
    static NSString *const identifier = @"ConAddressBottomInputCell";
    
    return identifier;
}


@end
