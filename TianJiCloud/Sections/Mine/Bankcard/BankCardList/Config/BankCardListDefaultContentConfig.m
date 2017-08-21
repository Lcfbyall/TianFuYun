//
//  BankCardListDefaultContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardListDefaultContentConfig.h"

@interface BankCardListDefaultContentConfig ()


@end


@implementation BankCardListDefaultContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    
    return CGSizeMake(cellWidth, 120);
}

- (NSString *)cellContent:(id)model{

  static NSString *const identifier = @"BankCardListDefaultCell";
    
  return identifier;
}

@end




