//
//  TJSBaseCollectionViewCellDelegate.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseCollectionViewCellDelegate_h
#define TJSBaseCollectionViewCellDelegate_h

@protocol TJSBaseCollectionViewCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)value;

- (BOOL)onLongPressCell:(id)value
                 inView:(UIView *)view;

- (void)onTapControl:(UIControl *)control value:(id)value;



@end


#endif /* TJSBaseCollectionViewCellDelegate_h */
