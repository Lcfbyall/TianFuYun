//
//  TJSProductListInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductListConfigurator.h"
#import "TJSProductListPrivateProtocol.h"

@interface TJSProductListInteractorImpl : NSObject<TJSProductListInteractor,TJSProductListLayoutDelegate>

@property(nonatomic,weak) id<TJSProductListInteractorDelegate> delegate;

@property(nonatomic,strong) id<TJSProductListDataSource> dataSource;

@property(nonatomic,strong) id<TJSProductListLayout> layout;

@end
