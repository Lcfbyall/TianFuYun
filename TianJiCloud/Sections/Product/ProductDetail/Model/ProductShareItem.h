//
//  ProductShareItem.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialManagerDefine.h"

@interface ProductShareItem : UIView

@property (nonatomic,assign) TJSSharePlatType plat;

@property (nonatomic,strong) UIImage  *btnImage;

@property (nonatomic,copy)   NSString *btnTitle;

@property (nonatomic,strong) UIImage  *btnImage_hig;

@property (nonatomic,copy)   NSString *btnTitle_hig;

@property (nonatomic,strong) UIColor  *btnColor;

@property (nonatomic,strong) UIColor  *btnColor_hig;


+ (NSArray <ProductShareItem *> *)productDetailShareItems;


@end
