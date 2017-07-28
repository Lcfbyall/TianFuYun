//
//  TJSDiscoNewListCellProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSDiscoNewListCellProtocol_h
#define TJSDiscoNewListCellProtocol_h


@protocol TJSDiscoNewListCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)event;

- (BOOL)onLongPressCell:(id)product
                 inView:(UIView *)view;


@end


#endif /* TJSDiscoNewListCellProtocol_h */
