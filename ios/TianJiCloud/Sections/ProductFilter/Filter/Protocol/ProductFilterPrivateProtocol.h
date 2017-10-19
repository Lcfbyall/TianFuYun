//
//  ProductFilterPrivateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ProductFilterPrivateProtocol_h
#define ProductFilterPrivateProtocol_h


////////////////////////////////////////////////
@interface ProductFilterOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *productInfoModels;
@end


@protocol ProductFilterDataSource <NSObject>

@optional

- (void)loadFilterParamas:(void (^)(NSArray *paramas, NSError *error))callback;

- (NSArray *)items;

- (UICollectionViewLayout *)collectionViewLayout;

- (NSArray *)filterParamas;

- (void)resetFilterParamas;
    

@end



@protocol ProductFilterLayoutDelegate <NSObject>

@optional

- (void)onRefresh;

@end

@protocol ProductFilterLayout <NSObject>

@optional

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths;

- (void)reloadCollect;

- (void)beginRefresh;

- (void)endRefresh;

- (void)setDelegate:(id<ProductFilterLayoutDelegate>)delegate;


@end


#import "ProductFilterController.h"

@interface ProductFilterController (Interactor)

- (void)setInteractor:(id<TJSProductFilterInteractor>) interactor;

@end



#endif /* ProductFilterPrivateProtocol_h */
