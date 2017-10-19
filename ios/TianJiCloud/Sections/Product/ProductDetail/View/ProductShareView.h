//
//  ProductShareView.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductShareItem.h"

@interface ProductShareView : UIControl

+ (instancetype)showWithItems:(NSArray <ProductShareItem *> *)items
                         done:(void (^)(NSInteger index))done;

@end

