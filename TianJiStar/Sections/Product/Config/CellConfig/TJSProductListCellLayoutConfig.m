//
//  TJSProductCellLayoutConfig.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListCellLayoutConfig.h"

#import "TJSBaseProductListContentConfig.h"

#import "TJSProductInfoModel.h"

@interface TJSProductListCellLayoutConfig ()

@end

@implementation TJSProductListCellLayoutConfig

+ (instancetype)sharedLayoutConfig
{
    static TJSProductListCellLayoutConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TJSProductListCellLayoutConfig alloc] init];
    });
    return instance;
}

- (CGSize)contentSize:(TJSProductInfoModel *)model cellWidth:(CGFloat)cellWidth{
    
    id<TJSProductListContentConfig>config =
     [[TJSProductListContentConfigFactory sharedFacotry] configBy:model.product];
    
    return [config contentSize:cellWidth product:model.product];
}

- (NSString *)cellContent:(TJSProductInfoModel *)model{
    
    id<TJSProductListContentConfig>config = [[TJSProductListContentConfigFactory sharedFacotry] configBy:model.product];
    
    NSString *cellContent = [config cellContent:model.product];
    
    return cellContent.length ? cellContent : @"ProductListCellContentView";
}




#pragma mark - Private

@end
