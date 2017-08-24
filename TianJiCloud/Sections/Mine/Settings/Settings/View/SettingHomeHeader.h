//
//  SettingHomeHeader.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/23.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingHomeHeader : UIView

+ (instancetype)headerWithUpload:(void (^)(id))block;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)tjs_bindDataWithValue:(id)value;

@end
