//
//  TJSPRroductListCellProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductListCellProtocol_h
#define TJSProductListCellProtocol_h


#import <Foundation/Foundation.h>
#import "TJSProductEvent.h"

@protocol TJSProductListCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)event;

- (BOOL)onLongPressCell:(id)product
                 inView:(UIView *)view;

- (BOOL)onTapLeftEdit:(id)data;

- (BOOL)onTapLikeBtn:(id)sender;


@end






#endif /* TJSProductListCellProtocol_h */


