//
//  TJSProductListImageContentConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListImageContentConfig.h"


@interface TJSProductListImageContentConfig ()

@end


@implementation TJSProductListImageContentConfig

- (CGSize)contentSize:(CGFloat)cellWidth product:(TJSProductInfo *)product{

     //根据自己业务实现
    return CGSizeZero;
}

- (NSString *)cellContent:(TJSProductInfo *)product{

   return @"ProductListCellImageContentView";
}


@end
