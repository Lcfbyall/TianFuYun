//
//  TJSProductEvent.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TJSProductInfoModel;

@interface TJSProductEvent : NSObject

@property (nonatomic,copy) NSString *eventName;

@property (nonatomic,strong) TJSProductInfoModel *productInfoModel;

@property (nonatomic,strong) id data;


@end


extern NSString *const TJSProductEventNameTapContent;
