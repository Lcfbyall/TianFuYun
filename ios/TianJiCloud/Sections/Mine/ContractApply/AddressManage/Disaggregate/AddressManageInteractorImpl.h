//
//  AddressManageInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddressManageConfigurateProtocol.h"
#import "AddressManagePrivateProtocol.h"

@interface AddressManageInteractorImpl : NSObject<AddressManageInteractor,AddressManageLayoutDelegate>

@property(nonatomic,weak) id<AddressManageInteractorDelegate> delegate;

@property(nonatomic,strong) id<AddressManageDataSource> dataSource;

@property(nonatomic,strong) id<AddressManageLayout> layout;


@end
