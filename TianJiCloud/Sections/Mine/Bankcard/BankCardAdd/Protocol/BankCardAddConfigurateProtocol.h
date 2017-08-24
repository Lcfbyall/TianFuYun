//
//  BankCardAddConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef BankCardAddConfigurateProtocol_h
#define BankCardAddConfigurateProtocol_h

@protocol BankCardAddInteractorDelegate <NSObject>

@optional


@end

@protocol BankCardAddInteractor <NSObject>

@optional

- (void)addBankCard:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (void)configWithBankCardInfo:(id)bankCardInfo;

//交互
- (void)showBank;

- (BOOL)canCommit;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end


#endif /* BankCardAddConfigurateProtocol_h */



