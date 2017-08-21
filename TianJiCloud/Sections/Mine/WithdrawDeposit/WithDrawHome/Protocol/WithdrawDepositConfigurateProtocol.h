//
//  WithdrawDepositConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef WithdrawDepositConfigurateProtocol_h
#define WithdrawDepositConfigurateProtocol_h

@protocol WithdrawDepositInteractorDelegate <NSObject>

@optional


@end

@protocol WithdrawDepositInteractor <NSObject>

@optional

- (void)addBankCard:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (void)configWithBankCardInfo:(id)bankCardInfo;

//交互
- (void)showBank;

- (BOOL)canCommit;


@end


#endif /* WithdrawDepositConfigurateProtocol_h */



