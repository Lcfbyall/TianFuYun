//
//  TJSMyBaseOrderListCellContentConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TJSMyOrderListCellContentConfig <NSObject>
@required

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model;

- (NSString *)cellContent:(id)model;

@end


@interface TJSMyOrderListCellContentConfigFactory : NSObject

+ (instancetype)sharedFacotry;

- (id<TJSMyOrderListCellContentConfig>)configBy:(id)model;


@end
