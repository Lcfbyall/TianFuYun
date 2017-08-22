//
//  WithDrawDepositConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef WithDrawDepositConfigurateProtocol_h
#define WithDrawDepositConfigurateProtocol_h

@protocol WithDrawDepositInteractorDelegate <NSObject>

@optional


@end

@protocol WithDrawDepositInteractor <NSObject>

@optional

- (void)withDrawForFree:(void (^)(id, NSError *))callback;

- (NSArray *)items;

- (void)configWithData:(id)data;

- (BOOL)canCommit;

@end


#endif /* WithDrawDepositConfigurateProtocol_h */



