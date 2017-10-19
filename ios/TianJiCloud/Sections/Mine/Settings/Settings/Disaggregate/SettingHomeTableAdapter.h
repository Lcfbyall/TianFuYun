//
//  SettingHomeTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SettingHomeConfigurateProtocol.h"

@interface SettingHomeTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) id<SettingHomeInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseTableViewCellDelegate> cellDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
