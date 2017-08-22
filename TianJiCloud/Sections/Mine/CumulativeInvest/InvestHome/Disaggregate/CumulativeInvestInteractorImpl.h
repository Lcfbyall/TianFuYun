//
//  CumulativeInvestInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CumulativeInvestConfigurateProtocol.h"
#import "CumulativeInvestPrivateProtocol.h"

@interface CumulativeInvestInteractorImpl : NSObject<CumulativeInvestInteractor,CumulativeInvestLayoutDelegate>

@property(nonatomic,weak) id<CumulativeInvestInteractorDelegate> delegate;

@property(nonatomic,strong) id<CumulativeInvestDataSource> dataSource;

@property(nonatomic,strong) id<CumulativeInvestLayout> layout;


@end
