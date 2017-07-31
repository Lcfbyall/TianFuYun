//
//  TJSMineHomeInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSMineHomeConfigurateProtocol.h"
#import "TJSMineHomePrivateProtocol.h"

@interface TJSMineHomeInteractorImpl : NSObject<TJSMineHomeInteractor,TJSMineHomeLayoutDelegate>

@property(nonatomic,weak) id<TJSMineHomeInteractorDelegate> delegate;

@property(nonatomic,strong) id<TJSMineHomeDataSource> dataSource;

@property(nonatomic,strong) id<TJSMineHomeLayout> layout;

@end
