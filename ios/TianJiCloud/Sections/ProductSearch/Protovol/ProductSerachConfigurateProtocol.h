//
//  ProductSerachConfigurateProtocol.h
//  TianJiCloud
//
//  Created by staff on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ProductSerachConfigurateProtocol_h
#define ProductSerachConfigurateProtocol_h


@protocol ProductSerachInteractorDelegate <NSObject>

@optional


@end

@protocol ProductSerachInteractor

@required

- (void)search:(void (^)(NSArray *products, NSError *error))callback;

- (NSArray *)items;

- (UICollectionViewLayout *)collectionViewLayout;

@end


#endif /* ProductSerachConfigurateProtocol_h */
