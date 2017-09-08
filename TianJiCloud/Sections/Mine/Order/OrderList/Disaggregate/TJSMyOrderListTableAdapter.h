//
//  TJSMyOrderListTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSMyOrderListConfigurateProtocol.h"

@interface TJSMyOrderListTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,weak) id<TJSMyOrderListInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseTableViewCellDelegate> cellDelegate;


- (instancetype)initWithTableView:(UITableView *)tableView;

@end
