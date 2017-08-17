//
//  AddressSelectedTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddressSelectedConfigurateProtocol.h"

@interface AddressSelectedTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) id<AddressSelectedInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseTableViewCellDelegate> cellDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
