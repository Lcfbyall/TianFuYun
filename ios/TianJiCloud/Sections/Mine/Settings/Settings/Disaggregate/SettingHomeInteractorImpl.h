//
//  SettingHomeInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingHomeConfigurateProtocol.h"
#import "SettingHomePrivateProtocol.h"

@interface SettingHomeInteractorImpl : NSObject<SettingHomeInteractor,SettingHomeLayoutDelegate>

@property(nonatomic,weak) id<SettingHomeInteractorDelegate> delegate;

@property(nonatomic,strong) id<SettingHomeDataSource> dataSource;

@property(nonatomic,strong) id<SettingHomeLayout> layout;


@end
