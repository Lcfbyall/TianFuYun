//
//  ProductInfoSearchModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductInfo.h"

@interface ProductInfoSearchModel : NSObject

@property (nonatomic,strong) TJSProductInfo *product;

@property (nonatomic,copy) NSString *cellClass;

@property (nonatomic,assign)CGSize nameSize;


- (instancetype)initWithProduct:(TJSProductInfo *)product;


@end
