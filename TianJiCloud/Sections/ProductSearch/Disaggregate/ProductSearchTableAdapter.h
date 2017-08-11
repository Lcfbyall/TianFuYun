//
//  ProductSearchTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductSerachConfigurateProtocol.h"

@interface ProductSearchTableAdapter : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) id<ProductSerachInteractor> interactor;

//@property (nonatomic,weak) id<TJSProductSearchCellDelegate> cellDelegate;


- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;


@end
