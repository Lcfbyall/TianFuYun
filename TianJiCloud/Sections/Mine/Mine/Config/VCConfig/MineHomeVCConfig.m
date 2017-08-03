//
//  MineHomeVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeVCConfig.h"

#import "MineViewController.h"
#import "UIImage+Resizeable.h"


@interface MineHomeVCConfig ()

@property (nonatomic,weak) MineViewController *vc;


@end

@implementation MineHomeVCConfig

#pragma mark -

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        
    }
    
    return self;
}


#pragma mark - controller settings

- (void)setup:(MineViewController *)vc{

    _vc = vc;
    
}

- (void)setfullScreen{
  
    //需要全屏
    //self.edgesForExtendedLayout = UIRectEdgeAll;
    
    //优先级高于edgesForExtendedLayout
    self.vc.navigationController.navigationBar.translucent = YES;
    //automaticallyAdjusts优先级高于translucent
    self.vc.automaticallyAdjustsScrollViewInsets = NO;
    
    //一定全屏
    //如果状态栏是不透明的，view将不会延伸到状态栏，除非将该属性的值设置为YES。
    //self.vc.extendedLayoutIncludesOpaqueBars = YES;
    
    //
    BOOL translucent = self.vc.tabBarController.tabBar.translucent;
    
    ((UITableView *)self.vc.tjs_listView).contentInset = UIEdgeInsetsMake(64, 0, translucent?49*2:0, 0);

}


#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{
    
    //user_setup
    WEAK_SELF(self);
    NSString *leftBarBtnImage  = @"avatar";
    UIImage *img = [[[UIImage imageNamed:leftBarBtnImage] tjs_drawInSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftItem  = [[UIBarButtonItem alloc] bk_initWithImage:img style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            
            if([self.vc conformsToProtocol:@protocol(MineHomeVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapLeftBarBtnToSettingList:)]){
                
                [self.vc onTapLeftBarBtnToSettingList:sender];
            }
        }
    }];
    
    NSArray *leftBarButtonItems = _vc.navigationItem.leftBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [leftBarButtonItems mutableCopy];
    [mutable addObject:leftItem];
    return [mutable copy];
}

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    //show_money  显示金额
    //hide_money  隐藏金额
    WEAK_SELF(self);
    NSString *rightBarBtnImage  = @"avatar";
    UIImage *img = [[[UIImage imageNamed:rightBarBtnImage] tjs_drawInSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithImage:img style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            
            if([self.vc conformsToProtocol:@protocol(MineHomeVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapRightBarBtnToHideSum:)]){
                
                [self.vc onTapRightBarBtnToHideSum:sender];
            }
        }
    }];
    
    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    return [mutable copy];
}


@end
