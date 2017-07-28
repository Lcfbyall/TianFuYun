//
//  TJSDiscoNewsListAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSDiscoNewsListConfigurateProtocol.h"
#import "TJSDiscoNewsListPrivateProtocol.h"

@interface TJSDiscoNewsListAdapter : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) id<TJSDiscoveryNewsListInteractor> interactor;

//@property (nonatomic,weak) id<TJSProductListCellDelegate> cellDelegate;



@end
