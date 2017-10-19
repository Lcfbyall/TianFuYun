//
//  TJSProductFilterLayoutImpl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductFilterPrivateProtocol.h"


@interface TJSProductFilterLayoutImpl : NSObject<ProductFilterLayout>

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

@end
