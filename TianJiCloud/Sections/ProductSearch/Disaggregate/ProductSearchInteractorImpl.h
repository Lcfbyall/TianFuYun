//
//  ProductSearchInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductSerachConfigurateProtocol.h"
#import "ProductSearchPrivateProtocol.h"

@interface ProductSearchInteractorImpl : NSObject<ProductSerachInteractor,ProductSearchLayoutDelegate>

@property(nonatomic,weak) id<ProductSerachInteractorDelegate> delegate;

@property(nonatomic,strong) id<ProductSearchDataSource> dataSource;

@property(nonatomic,strong) id<ProductSearchLayout> layout;

@end
