//
//  TJSMineHomeVCProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMineHomeVCProtocol_h
#define TJSMineHomeVCProtocol_h


@protocol MineHomeVCConfig <NSObject>

- (void)onTapLeftBarBtnToSettingList:(id)sender;

- (void)onTapRightBarBtnToHideOrShowSum:(id)sender;

@end

#endif /* TJSMineHomeVCProtocol_h */
