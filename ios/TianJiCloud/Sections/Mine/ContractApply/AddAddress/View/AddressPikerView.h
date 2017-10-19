//
//  AddressPikerView.h
//  TianJiCloud
//
//  Created by staff on 2017/8/19.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressPikerView : UIControl

+ (instancetype)showWithDatas:(NSArray *)datas
                   defaultRow:(NSInteger)defaultRow
                         done:(void (^)(NSInteger row))done;

- (void)show;

- (void)dismiss;

@end
