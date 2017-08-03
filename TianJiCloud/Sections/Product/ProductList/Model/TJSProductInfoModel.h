//
//  TJSProductInfoModel.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductInfo.h"

@interface TJSProductInfoModel : NSObject

@property (nonatomic,strong) TJSProductInfo *product;


- (instancetype)initWithProduct:(TJSProductInfo *)product;


@end
