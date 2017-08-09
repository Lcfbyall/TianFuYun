//
//  TJSProductFilterCollAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductFilterConfigurateProtocol.h"
#import "TJSProductFilterCellProtocol.h"


@interface TJSProductFilterCollAdapter : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) id<TJSProductFilterInteractor> interactor;

@property (nonatomic,weak) id<TJSProductFilterCellDelegate> cellDelegate;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;
    

@end
