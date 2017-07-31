//
//  TJSMineHomeCellProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMineHomeCellProtocol_h
#define TJSMineHomeCellProtocol_h


@protocol TJSMineHomeCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)obj;

- (BOOL)onLongPressCell:(id)obj
                 inView:(UIView *)view;

@end



#endif /* TJSMineHomeCellProtocol_h */
