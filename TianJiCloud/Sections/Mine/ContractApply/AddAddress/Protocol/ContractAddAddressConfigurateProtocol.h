//
//  ContractAddAddressConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractAddAddressConfigurateProtocol_h
#define ContractAddAddressConfigurateProtocol_h

@protocol ContractAddAddressInteractorDelegate <NSObject>

@optional


@end

@protocol ContractAddAddressInteractor <NSObject>

@optional

- (void)saveAddress:(void (^)(id, NSError *))callback;


- (NSArray *)items;

@end


#endif /* ContractAddAddressConfigurateProtocol_h */



