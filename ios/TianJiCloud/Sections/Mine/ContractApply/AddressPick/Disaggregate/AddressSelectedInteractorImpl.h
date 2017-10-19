//
//  AddressSelectedInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddressSelectedConfigurateProtocol.h"
#import "AddressSelectedPrivateProtocol.h"

@interface AddressSelectedInteractorImpl : NSObject<AddressSelectedInteractor,AddressSelectedLayoutDelegate>

@property(nonatomic,weak) id<AddressSelectedInteractorDelegate> delegate;

@property(nonatomic,strong) id<AddressSelectedDataSource> dataSource;

@property(nonatomic,strong) id<AddressSelectedLayout> layout;


@end
