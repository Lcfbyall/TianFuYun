//
//  CumulativeInvestConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef CumulativeInvestConfigurateProtocol_h
#define CumulativeInvestConfigurateProtocol_h

@protocol CumulativeInvestInteractorDelegate <NSObject>

@optional


@end

@protocol CumulativeInvestInteractor <NSObject>

@optional

- (void)loadInvest:(void (^)(id, NSError *))callback;

- (NSArray *)items;

@end


#endif /* CumulativeInvestConfigurateProtocol_h */



