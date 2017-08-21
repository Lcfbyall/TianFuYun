//
//  WithdrawDepositDefaultContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithdrawDepositDefaultContentConfig.h"

@interface WithdrawDepositDefaultContentConfig ()


@end


@implementation WithdrawDepositDefaultContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    
    return CGSizeMake(cellWidth, 100);
}

- (NSString *)cellContent:(id)model{

  static NSString *const identifier = @"WithDrawDepositSumCell";
    
  return identifier;
}

@end




