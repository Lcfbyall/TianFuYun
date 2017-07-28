//
//  DiscoveryNewsListCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TJSDiscoNewListCellProtocol.h"

@interface DiscoveryNewsListCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *aspectForIamge;

@property (nonatomic, weak)   id<TJSDiscoNewListCellDelegate> delegate;

@end
