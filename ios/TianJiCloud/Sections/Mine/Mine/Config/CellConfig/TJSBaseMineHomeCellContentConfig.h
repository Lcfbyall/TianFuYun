//
//  TJSBaseMineHomeCellContentConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSBaseCellContentConfigProtocol.h"

@protocol TJSMineHomeCellContentConfig <TJSBaseCellContentConfig>
@required


@end


@interface TJSMineHomeCellContentConfigFactory : NSObject

+ (instancetype)sharedFacotry;

- (id<TJSMineHomeCellContentConfig>)configBy:(id)model;


@end
