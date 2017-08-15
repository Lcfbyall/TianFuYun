//
//  ContractApplyInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContractApplyConfigurateProtocol.h"
#import "ContractApplyPrivateProtocol.h"

@interface ContractApplyInteractorImpl : NSObject<ContractApplyInteractor,ContractApplyLayoutDelegate>

@property(nonatomic,weak) id<ContractApplyInteractorDelegate> delegate;

@property(nonatomic,strong) id<ContractApplyDataSource> dataSource;

@property(nonatomic,strong) id<ContractApplyLayout> layout;


@end
