//
//  ContractListInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContractListConfigurateProtocol.h"
#import "ContractListPrivateProtocol.h"

@interface ContractListInteractorImpl : NSObject<ContractListInteractor,ContractListLayoutDelegate>

@property(nonatomic,weak) id<ContractListInteractorDelegate> delegate;

@property(nonatomic,strong) id<ContractListDataSource> dataSource;

@property(nonatomic,strong) id<ContractListLayout> layout;


@end
