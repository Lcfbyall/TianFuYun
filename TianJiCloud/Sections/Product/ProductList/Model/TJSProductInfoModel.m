//
//  TJSProductInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductInfoModel.h"


@implementation TJSProductInfoModel


- (instancetype)initWithProduct:(TJSProductInfo *)product{
  
    self = [super init];
    
    if(self){
    
        
        _product = product;
        
    }

    return self;
}



@end
