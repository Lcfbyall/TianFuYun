//
//  ProductSearchPrivateProtocol.h
//  TianJiCloud
//
//  Created by staff on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ProductSearchPrivateProtocol_h
#define ProductSearchPrivateProtocol_h


@interface ProductSearchOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end

@protocol ProductSearchDataSource <NSObject>

@optional

- (void)search:(void (^)(NSArray *products, NSError *error))callback;

- (NSArray *)items;

- (UICollectionViewLayout *)collectionViewLayout;

@end



@protocol ProductSearchLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol ProductSearchLayout <NSObject>

@optional

- (void)reloadCollect;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<ProductSearchLayoutDelegate>)delegate;


@end




#import "ProductSearchController.h"

@interface ProductSearchController (Interactor)

- (void)setInteractor:(id<ProductSerachInteractor>) interactor;

@end



#endif /* ProductSearchPrivateProtocol_h */
