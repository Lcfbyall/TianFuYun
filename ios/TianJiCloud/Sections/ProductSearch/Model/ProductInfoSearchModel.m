//
//  ProductInfoSearchModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductInfoSearchModel.h"
#import "NSString+StringSize.h"

@implementation ProductInfoSearchModel

- (instancetype)initWithProduct:(TJSProductInfo *)product{
    
    self = [super init];
    
    if(self){
        
        _product = product;
        
        CGFloat productNameHeight = 40;
        CGFloat productNameWidth = [product.name tjs_stringSizeWithFont:[UIFont systemFontOfSize:13.0f] size:CGSizeMake(SCREEN_WIDTH, productNameHeight)].width + 30;
        
        _nameSize = CGSizeMake(productNameWidth, productNameHeight);
     
    }
    
    return self;
}

@end
