//
//  HomeVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "HomeVCConfig.h"

#import "HomeViewController.h"

#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@interface HomeVCConfig ()

@property (nonatomic,weak) HomeViewController *vc;

@end

@implementation HomeVCConfig

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        
    }
    
    return self;
}

- (void)setup:(HomeViewController *)vc{
    
    _vc = vc;
    
    
}


#pragma mark - TJSNavigationConfig

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{
    WEAK_SELF(self);
    NSString *leftBarBtnImage  = @"msg_home";
    
    UIBarButtonItem *leftItem  = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(leftBarBtnImage) style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            if([_vc conformsToProtocol:@protocol(HomeVCConfig)] &&
               [_vc respondsToSelector:@selector(onTapLeftBarBtnToMessageKindList:)]){
                
                [_vc onTapLeftBarBtnToMessageKindList:sender];
            }
        }
    }];
    
    return [NSArray arrayWithObject:leftItem];
}

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    WEAK_SELF(self);
    NSString *rightBarBtnImage  = @"screen";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(rightBarBtnImage) style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            
            if([_vc conformsToProtocol:@protocol(HomeVCConfig)] &&
               [_vc respondsToSelector:@selector(onTapRightBarBtnToProductFilter:)]){
                
                [_vc onTapRightBarBtnToProductFilter:sender];
            }
        }
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
