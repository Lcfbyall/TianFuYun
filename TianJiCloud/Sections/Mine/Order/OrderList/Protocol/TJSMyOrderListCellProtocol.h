//
//  TJSMyOrderListCellProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMyOrderListCellProtocol_h
#define TJSMyOrderListCellProtocol_h

@protocol MyOrderListCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)obj;

- (BOOL)onLongPressCell:(id)obj
                 inView:(UIView *)view;

@end

#endif /* TJSMyOrderListCellProtocol_h */
