//
//  BankCardListInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BankCardListConfigurateProtocol.h"
#import "BankCardListPrivateProtocol.h"

@interface BankCardListInteractorImpl : NSObject<BankCardListInteractor,BankCardListLayoutDelegate>

@property(nonatomic,weak) id<BankCardListInteractorDelegate> delegate;

@property(nonatomic,strong) id<BankCardListDataSource> dataSource;

@property(nonatomic,strong) id<BankCardListLayout> layout;


@end
