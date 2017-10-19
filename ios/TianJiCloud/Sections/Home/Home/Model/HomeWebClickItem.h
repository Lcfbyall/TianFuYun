//
//  HomeWebClickItem.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/1.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeWebClickItem : NSObject

@property (nonatomic,copy) NSString *webUrl;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *subTitle;

@property (nonatomic,copy) NSString *imgUrl;

@property (nonatomic,strong) NSString *target;

@property (nonatomic,assign) BOOL pushAllowed;

@end
