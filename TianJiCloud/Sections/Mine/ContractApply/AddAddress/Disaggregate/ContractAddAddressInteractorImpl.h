//
//  ContractAddAddressInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContractAddAddressConfigurateProtocol.h"
#import "ContractAddAddressPrivateProtocol.h"

@interface ContractAddAddressInteractorImpl : NSObject<ContractAddAddressInteractor,ContractAddAddressLayoutDelegate>

@property(nonatomic,weak) id<ContractAddAddressInteractorDelegate> delegate;

@property(nonatomic,strong) id<ContractAddAddressDataSource> dataSource;

@property(nonatomic,strong) id<ContractAddAddressLayout> layout;


@end
