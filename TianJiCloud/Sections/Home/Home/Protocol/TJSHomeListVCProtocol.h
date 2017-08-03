//
//  TJSHomeListVCProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSHomeListVCProtocol_h
#define TJSHomeListVCProtocol_h


@protocol HomeVCConfig <NSObject>

- (void)onTapLeftBarBtnToMessageKindList:(id)sender;

- (void)onTapRightBarBtnToProductFilter:(id)sender;

- (void)onTapSearchBarToProductSearch:(id)sender;

@end

#endif /* TJSHomeListVCProtocol_h */
