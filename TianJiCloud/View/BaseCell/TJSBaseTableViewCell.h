//
//  TJSBaseTableViewCell.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TJSBaseTableViewCellProtocol.h"
#import "TJSBaseTableViewCellDelegate.h"

@interface TJSBaseTableViewCell : UITableViewCell<TJSBaseTableViewCellProtocol>

@property (nonatomic,weak)id <TJSBaseTableViewCellDelegate> delegate;


@end




