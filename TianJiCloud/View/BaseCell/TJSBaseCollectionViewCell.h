//
//  TJSBaseCollectionViewCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/2.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TJSBaseCollectionViewCellDelegate.h"
#import "TJSBaseCollectionReusableViewProtocol.h"

@interface TJSBaseCollectionViewCell : UICollectionViewCell<TJSBaseCollectionReusableViewProtocol>

@property (nonatomic,weak)id <TJSBaseCollectionViewCellDelegate> delegate;

@end
