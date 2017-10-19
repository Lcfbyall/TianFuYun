//
//  ProductFilterItem.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductFilterItem : NSObject

@property (nonatomic,copy)   NSString  *title;

@property (nonatomic,copy)   NSString  *img;

@property (nonatomic,assign) BOOL selected;

@end
