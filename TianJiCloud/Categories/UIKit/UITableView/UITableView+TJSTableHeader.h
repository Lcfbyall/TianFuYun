//
//  UITableView+TJSTableHeader.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (TJSTableHeader)

- (void)tjs_reloadTableHeader;

- (void)tjs_headerWithRefreshingBlock:(void (^)(UITableView *tableView))callback;

@end
