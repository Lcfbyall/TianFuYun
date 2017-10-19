//
//  WithDrawDepositInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WithDrawDepositConfigurateProtocol.h"
#import "WithDrawDepositPrivateProtocol.h"

@interface WithDrawDepositInteractorImpl : NSObject<WithDrawDepositInteractor,WithDrawDepositLayoutDelegate>

@property(nonatomic,weak) id<WithDrawDepositInteractorDelegate> delegate;

@property(nonatomic,strong) id<WithDrawDepositDataSource> dataSource;

@property(nonatomic,strong) id<WithDrawDepositLayout> layout;


@end
