//
//  TJSProductFilterInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductFilterConfigurateProtocol.h"
#import "ProductFilterPrivateProtocol.h"


@interface TJSProductFilterInteractorImpl : NSObject<TJSProductFilterInteractor,ProductFilterLayoutDelegate>

@property(nonatomic,weak) id<TJSProductFilterInteractorDelegate> delegate;

@property(nonatomic,strong) id<ProductFilterDataSource> dataSource;

@property(nonatomic,strong) id<ProductFilterLayout> layout;


@end
