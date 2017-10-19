//
//  TJSBaseProductListContentConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseCellContentConfigProtocol.h"
@class TJSProductInfo;


@protocol TJSProductListContentConfig <TJSBaseCellContentConfig>
@required


@end



@interface TJSProductListContentConfigFactory : NSObject

+ (instancetype)sharedFacotry;
- (id<TJSProductListContentConfig>)configBy:(TJSProductInfo *)product;



@end
