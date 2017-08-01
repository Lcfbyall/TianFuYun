//
//  TJSHomeListTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSHomeListConfigurateProtocol.h"
#import "TJSProductListCellProtocol.h"

@interface TJSHomeListTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) id<TJSHomeListInteractor> interactor;

@property (nonatomic,weak) id<TJSProductListCellDelegate> cellDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
