//
//  ProductSearchVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/26.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchVCConfig.h"
#import <BlocksKit/UIBarButtonItem+BlocksKit.h>


@interface ProductSearchVCConfig ()

@property (nonatomic,weak) ProductSearchController *vc;

@end

@implementation ProductSearchVCConfig

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        
    }
    
    return self;
}

- (void)setup:(ProductSearchController *)vc{

    _vc = vc;
    
    
 
}



#pragma mark - TJSNavigationConfig

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{

    WEAK_SELF(self);
    NSString *rightBarBtnImage  = @"header-zhuye";
    NSString *rightBarBtnSelStr = @"onTapRightBarBtnToAttention:";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGE(rightBarBtnImage)
                   style:UIBarButtonItemStylePlain
                 handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            SEL rightBarBtnSEL  = NSSelectorFromString(rightBarBtnSelStr);
            if([_vc respondsToSelector:rightBarBtnSEL]){
                SuppressPerformSelectorLeakWarning([_vc performSelector:rightBarBtnSEL withObject:sender]);
            }}
    }];
    return [NSArray arrayWithObject:rightItem];
}

- (UIView *)tjs_titleView{

    return nil;
}



@end
