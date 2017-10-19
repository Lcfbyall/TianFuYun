//
//  TJSHomeListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSHomeListConfigurateProtocol_h
#define TJSHomeListConfigurateProtocol_h

#import "TJSProductInfoModel.h"
@protocol TJSHomeListInteractorDelegate <NSObject>

@optional


@end


@protocol TJSHomeListInteractor <NSObject>

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


#endif /* TJSHomeListConfigurateProtocol_h */



