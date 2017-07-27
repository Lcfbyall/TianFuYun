//
//  TJSProductListConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductListConfigurateProtocol_h
#define TJSProductListConfigurateProtocol_h

#import "TJSProductInfoModel.h"

@protocol TJSProductListInteractorDelegate <NSObject>

@optional

@end


@protocol TJSProductListInteractor <NSObject>

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



#endif /* TJSProductListConfigurateProtocol_h */
