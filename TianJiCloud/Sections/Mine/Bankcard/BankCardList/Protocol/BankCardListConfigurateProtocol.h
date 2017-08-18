//
//  BankCardListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef BankCardListConfigurateProtocol_h
#define BankCardListConfigurateProtocol_h

@protocol BankCardListInteractorDelegate <NSObject>

@optional


@end

@protocol BankCardListInteractor <NSObject>

@optional

- (void)loadBankCardList:(void (^)(id, NSError *))callback;


- (NSArray *)items;

@end


#endif /* BankCardListConfigurateProtocol_h */



