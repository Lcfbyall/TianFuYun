//
//  TJSBaseTableHeaderFooterView.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TJSBaseTableHeaderFooterViewProtocol <NSObject>

@optional

// 注册并创建 cell
+ (instancetype)tjs_makeHeaderFooterForAllocTableView:(UITableView *)tableView;
// 注册并创建 xib cell
+ (instancetype)tjs_makeHeaderFooterForNibTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

// 数据绑定赋值
- (void)tjs_bindDataToCellWithValue:(id)value;

@end


@interface TJSBaseTableHeaderFooterView : UITableViewHeaderFooterView<TJSBaseTableHeaderFooterViewProtocol>

@end
