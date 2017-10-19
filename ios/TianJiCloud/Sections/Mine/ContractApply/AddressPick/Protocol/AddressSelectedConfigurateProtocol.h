//
//  AddressSelectedConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef AddressSelectedConfigurateProtocol_h
#define AddressSelectedConfigurateProtocol_h

@protocol AddressSelectedInteractorDelegate <NSObject>

@optional


@end

@protocol AddressSelectedInteractor <NSObject>

@optional


- (NSArray *)items;

@end


#endif /* AddressSelectedConfigurateProtocol_h */



