//
//  TJSProductListTextContentConfig.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListTextContentConfig.h"

@implementation TJSProductListTextContentConfig

- (CGSize)contentSize:(CGFloat)cellWidth product:(TJSProductInfo *)product{
    
    //根据自己业务实现
    return CGSizeZero;
}

- (NSString *)cellContent:(TJSProductInfo *)product{
    
    return @"ProductListCellTextContentView";
}



@end
