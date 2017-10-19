//
//  TJSHomeListInteractorImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSHomeListConfigurateProtocol.h"
#import "TJSHomeListPrivateProtocol.h"

@interface TJSHomeListInteractorImpl : NSObject<TJSHomeListInteractor,TJSHomeListLayoutDelegate>



@property(nonatomic,weak) id<TJSHomeListInteractorDelegate> delegate;

@property(nonatomic,strong) id<TJSHomeListDataSource> dataSource;

@property(nonatomic,strong) id<TJSHomeListLayout> layout;



@end
