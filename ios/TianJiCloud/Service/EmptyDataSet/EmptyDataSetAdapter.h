//
//  EmptyDataSetAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmptyDataSetAdapter : NSObject

- (instancetype _Nullable)init NS_UNAVAILABLE;

+ (instancetype _Nullable )adapterWithScrollView:(UIScrollView *_Nullable)scrollView;

@end
