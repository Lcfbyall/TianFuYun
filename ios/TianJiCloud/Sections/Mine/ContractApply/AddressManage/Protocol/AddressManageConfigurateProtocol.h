//
//  AddressManageConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef AddressManageConfigurateProtocol_h
#define AddressManageConfigurateProtocol_h

@protocol AddressManageInteractorDelegate <NSObject>

@optional


@end

@protocol AddressManageInteractor <NSObject>

@optional


- (NSArray *)items;

@end


#endif /* AddressManageConfigurateProtocol_h */



