//
//  ContractAddAddressConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ContractAddAddressConfigurateProtocol_h
#define ContractAddAddressConfigurateProtocol_h

@protocol ContractAddAddressInteractorDelegate <NSObject>

@optional

- (void)updateCommitBtn;

@end

@protocol ContractAddAddressInteractor <NSObject>

@optional

- (void)loadAddres:(void (^)(id, NSError *))callback;

- (void)saveAddress:(void (^)(id, NSError *))callback;

- (NSArray *)items;

//
- (void)showRegion;

- (NSArray *)regions;

- (void)fillingRegion:(NSString *)region;

- (NSInteger)regionIndex;

- (BOOL)canCommit;

@end


#endif /* ContractAddAddressConfigurateProtocol_h */



