//
//  AddressManageDefaultContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageDefaultContentConfig.h"

@interface AddressManageDefaultContentConfig ()



@end


@implementation AddressManageDefaultContentConfig

#pragma mark - <TJSBaseCellContentConfig>

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model{

    
    return CGSizeMake(cellWidth, 125);
}

- (NSString *)cellContent:(id)model{

  static NSString *const identifier = @"AddressManageDefaultCell";
    
  return identifier;
}

@end




