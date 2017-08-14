//
//  ContractListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractListConfigurateProtocol_h
#define ContractListConfigurateProtocol_h

#import "ContractInfoModel.h"

@protocol ContractListInteractorDelegate <NSObject>

@optional


@end


@protocol ContractListInteractor <NSObject>

@optional

//
- (void)loadContracts:(void (^)(NSArray *products, NSError *error))callback;

- (void)deleteContracts:(NSArray <ContractInfoModel *> *)products
              callback:(void (^)(BOOL success, NSError *error))callback;

- (void)deleteContract:(ContractInfoModel *)product
             callback:(void (^)(BOOL success, NSError *error))callback;

//
- (NSArray *)items;

- (void)onViewWillAppear;

- (void)onViewDidDisappear;


@end





#endif /* ContractListConfigurateProtocol_h */
