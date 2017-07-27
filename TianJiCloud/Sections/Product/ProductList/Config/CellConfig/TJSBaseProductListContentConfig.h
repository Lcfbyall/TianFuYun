//
//  TJSBaseProductListContentConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TJSProductInfo;

@protocol TJSProductListContentConfig <NSObject>
@required

- (CGSize)contentSize:(CGFloat)cellWidth product:(TJSProductInfo *)product;

- (NSString *)cellContent:(TJSProductInfo *)product;

@end



@interface TJSProductListContentConfigFactory : NSObject

+ (instancetype)sharedFacotry;
- (id<TJSProductListContentConfig>)configBy:(TJSProductInfo *)product;



@end
