//
//  TJSPRroductListCellProtocol.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductListCellProtocol_h
#define TJSProductListCellProtocol_h


#import <Foundation/Foundation.h>

@protocol TJSProductListCellDelegate <NSObject>

@optional

- (BOOL)onTapCell:(id)event;

- (BOOL)onLongPressCell:(id)message
                 inView:(UIView *)view;

@end

#endif /* TJSProductListCellProtocol_h */


