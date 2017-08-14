//
//  HomeVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//


#import "HomeVCConfig.h"
#import "HomeViewController.h"


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


#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{
    
    WEAK_SELF(self);
    NSString *leftBarBtnImage  = @"msg_home";
    
    UIBarButtonItem *leftItem  = [[UIBarButtonItem alloc] bk_initWithImage:IMAGEOriginal(leftBarBtnImage) style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            if([self.vc conformsToProtocol:@protocol(HomeVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapLeftBarBtnToMessageKindList:)]){
                
                [self.vc onTapLeftBarBtnToMessageKindList:sender];
            }
        }
    }];
    
    NSArray *leftBarButtonItems = _vc.navigationItem.leftBarButtonItems?:[NSArray array];
    
    NSMutableArray *mutable = [leftBarButtonItems mutableCopy];
    [mutable addObject:leftItem];
    
    return [mutable copy];
}

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    WEAK_SELF(self);
    NSString *rightBarBtnImage  = @"screen";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithImage:IMAGEOriginal(rightBarBtnImage) style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
            
            if([self.vc conformsToProtocol:@protocol(HomeVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapRightBarBtnToProductFilter:)]){
                
                [self.vc onTapRightBarBtnToProductFilter:sender];
            }
        }
    }];
    
    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    
    return [mutable copy];
}

- (UIView *)tjs_titleView{
    
    UIView *bgView = [UIView new];
    UIColor *bgColor = ThemeService.weak_color_00;
    CGRect frame   =  CGRectMake(0, 0, SCREEN_WIDTH-140, 35);
    bgView.frame   = frame;
    bgView.backgroundColor     = bgColor;
    bgView.layer.cornerRadius  = frame.size.height/2.0;
    bgView.layer.masksToBounds = YES;
   
    
    UISearchBar *searchBar     = [[UISearchBar alloc] init];
    searchBar.placeholder      = @"搜索你需要的产品";
    searchBar.frame            = bgView.bounds;
    
    searchBar.backgroundColor  = bgColor;
    searchBar.tintColor        = ThemeService.main_color_02;
    searchBar.barTintColor     = bgColor;
    
    [searchBar setSearchFieldBackgroundImage:[UIImage tjs_imageWithColor:bgColor size:searchBar.bounds.size] forState:UIControlStateNormal];

    [bgView addSubview:searchBar];
    
    
    WEAK_SELF(self);
    searchBar.searchBarShouldBeginEditing = ^BOOL(UISearchBar *searchBar) {
        
        STRONG_SELF(self);
        if([self.vc conformsToProtocol:@protocol(HomeVCConfig)] &&
           [self.vc respondsToSelector:@selector(onTapSearchBarToProductSearch:)]){
            
            [self.vc onTapSearchBarToProductSearch:searchBar];
        }
    
        return NO;
    };
    
    
    searchBar.searchBarTextDidBeginEditing = ^(UISearchBar *searchBar){
    

        [self.vc.navigationController.navigationBar endEditing:YES];
    };
    

    return bgView;
}

@end
