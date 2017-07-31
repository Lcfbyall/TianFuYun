//
//  TJSBaseMineHomeCellContentConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TJSMineHomeCellContentConfig <NSObject>
@required

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model;

- (NSString *)cellContent:(id)model;

@end


@interface TJSMineHomeCellContentConfigFactory : NSObject

+ (instancetype)sharedFacotry;

- (id<TJSMineHomeCellContentConfig>)configBy:(id)model;


@end
