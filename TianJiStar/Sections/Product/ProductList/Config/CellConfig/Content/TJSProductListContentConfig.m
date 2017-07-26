//
//  TJSProductListContentConfig.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListContentConfig.h"

@implementation TJSProductListContentConfig

- (CGSize)contentSize:(CGFloat)cellWidth product:(TJSProductInfo *)product{
    
    //根据自己业务实现
    
    return CGSizeMake(cellWidth, 60);
}

- (NSString *)cellContent:(TJSProductInfo *)product{
    
    return @"ProductListCellContentView";
}


@end
