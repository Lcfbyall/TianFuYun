//
//  SettingHomeConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef SettingHomeConfigurateProtocol_h
#define SettingHomeConfigurateProtocol_h

@protocol SettingHomeInteractorDelegate <NSObject>

@optional


@end

@protocol SettingHomeInteractor <NSObject>

@optional

- (NSArray *)items;

@end


#endif /* SettingHomeConfigurateProtocol_h */



