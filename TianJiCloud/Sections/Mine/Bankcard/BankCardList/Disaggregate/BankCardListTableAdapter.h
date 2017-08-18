//
//  BankCardListTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BankCardListConfigurateProtocol.h"

@interface BankCardListTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) id<BankCardListInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseTableViewCellDelegate> cellDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
