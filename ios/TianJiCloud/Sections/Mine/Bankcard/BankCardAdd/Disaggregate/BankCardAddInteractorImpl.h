//
//  BankCardAddInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BankCardAddConfigurateProtocol.h"
#import "BankCardAddPrivateProtocol.h"

@interface BankCardAddInteractorImpl : NSObject<BankCardAddInteractor,BankCardAddLayoutDelegate>

@property(nonatomic,weak) id<BankCardAddInteractorDelegate> delegate;

@property(nonatomic,strong) id<BankCardAddDataSource> dataSource;

@property(nonatomic,strong) id<BankCardAddLayout> layout;


@end
