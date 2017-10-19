//
//  ProductFilterResultInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductFilterResultConfigurateProtocol.h"
#import "ProductFilterResultPrivateProtocol.h"


@interface ProductFilterResultInteractorImpl : NSObject<ProductFilterResultInteractor,ProductFilterResultLayoutDelegate>


@property(nonatomic,weak) id<ProductFilterResultInteractorDelegate> delegate;

@property(nonatomic,strong) id<ProductFilterResultDataSource> dataSource;

@property(nonatomic,strong) id<ProductFilterResultLayout> layout;


@end
