//
//  MyFavListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef MyFavListConfigurateProtocol_h
#define MyFavListConfigurateProtocol_h

#import "TJSProductInfoModel.h"

@protocol MyFavListInteractorDelegate <NSObject>

@optional


@end


@protocol MyFavListInteractor <NSObject>

@optional

//
- (void)loadProducts:(void (^)(NSArray *products, NSError *error))callback;

- (void)deleteProducts:(NSArray <TJSProductInfoModel *> *)products
              callback:(void (^)(BOOL success, NSError *error))callback;

- (void)deleteProduct:(TJSProductInfoModel *)product
             callback:(void (^)(BOOL success, NSError *error))callback;

//
- (NSArray *)items;

- (void)onViewWillAppear;

- (void)onViewDidDisappear;

@end


#endif /* MyFavListConfigurateProtocol_h */
