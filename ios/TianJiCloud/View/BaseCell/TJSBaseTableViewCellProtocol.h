//
//  TJSBaseTableViewCellProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/16.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseTableViewCellProtocol_h
#define TJSBaseTableViewCellProtocol_h


@protocol TJSBaseTableViewCellProtocol <NSObject>

@optional


// 注册并创建 cell
+ (instancetype)tjs_makeCellForAllocTableView:(UITableView *)tableView;
// 注册并创建 xib cell
+ (instancetype)tjs_makeCellForNibTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

// 数据绑定赋值
- (void)tjs_bindDataToCellWithValue:(id)value;


// 解决 tableView cell 的分割线左边不到头的问题
- (BOOL)tjs_checkData;
- (void)tjs_separatorInsetZero;
- (void)tjs_separatorInsetZeroWithTableView:(UITableView *)tableView;
@end


#endif /* TJSBaseTableViewCellProtocol_h */
