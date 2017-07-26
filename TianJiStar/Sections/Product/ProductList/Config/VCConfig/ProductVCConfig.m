//
//  ProductVCConfig.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductVCConfig.h"
#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@interface ProductVCConfig ()

@end

@implementation ProductVCConfig

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(@"header-message") style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        
    }];
  
    return [NSArray arrayWithObject:leftItem];
}

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(@"header-search-white") style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        
    }];
    
    return [NSArray arrayWithObject:rightItem];
}

- (UIView *)tjs_titleView{

    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"全部",@"收藏"]];
    segment.frame     = CGRectMake(0,0,120,30);
    segment.tintColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    
    //[segment addTarget:self action:@selector(segmentcontrolTimeChange:) forControlEvents:UIControlEventValueChanged];
  
    return segment;
}


@end
