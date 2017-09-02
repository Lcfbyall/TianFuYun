//
//  TJSMineHomeTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSMineHomeConfigurateProtocol.h"

@interface TJSMineHomeTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) id<TJSMineHomeInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseTableViewCellDelegate> cellDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;


@end
