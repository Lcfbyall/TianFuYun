//
//  MyFavListTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyFavListConfigurateProtocol.h"

@interface MyFavListTableAdapter : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) id<MyFavListInteractor> interactor;

@property (nonatomic,weak) id<TJSBaseTableViewCellDelegate> cellDelegate;



- (instancetype)initWithTableView:(UITableView *)tableView;

@end
