//
//  TJSProductCellLayoutConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductCellLayoutProtocol.h"

@interface TJSProductListCellLayoutConfig : NSObject<TJSProductCellLayoutConfig>

+ (instancetype)sharedLayoutConfig;

@end
