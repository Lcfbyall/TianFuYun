//
//  ProductFilterProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef ProductFilterProtocol_h
#define ProductFilterProtocol_h


@protocol ProductFilterConfig <NSObject>

- (void)resetBtnConfig:(UIButton *)btn;

- (void)sureBtnConfig:(UIButton *)btn;


@end


#endif /* ProductFilterProtocol_h */
