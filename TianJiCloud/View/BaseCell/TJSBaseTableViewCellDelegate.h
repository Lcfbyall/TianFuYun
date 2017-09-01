//
//  TJSTableViewCellDelegate.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseTableViewCellDelegate_h
#define TJSBaseTableViewCellDelegate_h

@protocol TJSBaseTableViewCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)value;

- (BOOL)onLongPressCell:(id)value
                 inView:(UIView *)view;

- (void)onTapControl:(UIControl *)control value:(id)value;


@end


#endif /* TJSTableViewCellDelegate_h */
