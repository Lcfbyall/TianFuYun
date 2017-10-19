//
//  WithDrawDepositHomeHeader.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WithDrawDepositHomeHeader : UIView

+ (instancetype)header;

- (void)tjs_bindDataToCellWithValue:(id)value;

@end
