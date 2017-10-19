//
//  DiscoRoadShowListAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DiscoRoadShowListConfigurateProtocol.h"
#import "DiscoRoadShowListPrivateProtocol.h"

@interface DiscoRoadShowListAdapter : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>


- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;


@property (nonatomic,weak) id<DiscoRoadShowListInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseCollectionViewCellDelegate> cellDelegate;



@end
