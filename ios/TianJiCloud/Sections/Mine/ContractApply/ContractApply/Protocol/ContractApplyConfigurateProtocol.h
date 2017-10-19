//
//  ContractApplyConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractApplyConfigurateProtocol_h
#define ContractApplyConfigurateProtocol_h

@protocol ContractApplyInteractorDelegate <NSObject>

@optional


@end

@protocol ContractApplyInteractor <NSObject>

@optional

- (void)applyContractWithParams:(id)params callback:(void (^)(id, NSError *))callback;;

- (void)searchProductWithKey:(NSString *)key callback:(void (^)(NSArray *, NSError *))callback;;

- (NSArray *)items;

@end


#endif /* ContractApplyConfigurateProtocol_h */



