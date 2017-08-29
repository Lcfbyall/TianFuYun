//
//  ProductDetailFooter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailFooter : UIView

+ (instancetype)footerWithDone:(void (^)(NSInteger index))done;

@end
