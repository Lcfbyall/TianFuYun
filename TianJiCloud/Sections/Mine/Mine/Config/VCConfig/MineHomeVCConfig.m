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
    
    _vc.params = @{
                   NavigationBarTranslucentKey:@(YES),
                   NavigationBarBarTintColor:  [UIColor redColor]
                   
                   };
}


//viewWillAppear -> willShowViewController
- (void)setfullScreen{
    

    //需要全屏
    //1.self.edgesForExtendedLayout = UIRectEdgeAll;
    
    //2.优先级高于edgesForExtendedLayout
        //1).这个属性有两个功能：1设置导航条（nav,tabbar）为半透明状态；
        //2).修改当前控制器根容器下的屏幕起始原点
    //self.vc.navigationController.navigationBar.translucent = YES;
    
    //3.automaticallyAdjusts优先级高于translucent
    //简单点说就是automaticallyAdjustsScrollViewInsets根据按所在界面的status bar，navigationbar，与tabbar的高度，自动调整scrollview的 inset
    self.vc.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //4.一定全屏
    //如果状态栏是不透明的，view将不会延伸到状态栏，除非将该属性的值设置为YES。
    //self.vc.extendedLayoutIncludesOpaqueBars = YES;
    
    
    //设置
    UITableView *mineTable = (UITableView *)self.vc.tjs_listView;
    BOOL translucent = self.vc.tabBarController.tabBar.translucent;
    mineTable.contentInset = UIEdgeInsetsMake(mineTable.contentInset.top, 0, translucent?49:0, 0);

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
