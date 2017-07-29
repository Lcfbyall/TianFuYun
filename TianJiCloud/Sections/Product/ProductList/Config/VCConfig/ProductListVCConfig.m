//
//  ProductVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListVCConfig.h"
#import "ProductListViewController.h"

#import "UIImage+FromColor.h"
#import "UISearchBar+TJSBlock.h"
#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@interface ProductListVCConfig ()<UISearchBarDelegate>

@property (nonatomic,weak) ProductListViewController *vc;

@end

@implementation ProductListVCConfig : NSObject 

- (instancetype)init{

    self = [super init];
    if(self){
     
        
    }
    
    return self;
}

- (void)setup:(ProductListViewController *)vc{
   
    _vc = vc;
    
    
}


#pragma mark - TJSNavigationConfig

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    WEAK_SELF(self);
    NSString *rightBarBtnImage  = @"screen";

    UIBarButtonItem *rightItem  = [[UIBarButtonItem alloc] bk_initWithImage:IMAGEOriginal(rightBarBtnImage) style:UIBarButtonItemStylePlain handler:^(id sender) {
        STRONG_SELF(self);
        if(self){
        
            if([_vc conformsToProtocol:@protocol(ProductListVCConfig)]&&[_vc respondsToSelector:@selector(onTapRightBarBtnToProductSearch:)]){
                
                [_vc onTapRightBarBtnToProductSearch:sender];
            }
        }
    }];

    return [NSArray arrayWithObject:rightItem];
}

- (UIView *)tjs_titleView{

    
    UIView *bgView = [UIView new];
    CGRect frame   =  CGRectMake(0, 0, SCREEN_WIDTH-120, 35);
    bgView.frame   = frame;
    bgView.backgroundColor     = _vc.navigationController.navigationBar.barTintColor;
    bgView.layer.cornerRadius  = frame.size.height/2.0;
    bgView.layer.masksToBounds = YES;
    [bgView.layer setBorderWidth:1];
    [bgView.layer setBorderColor:ThemeService.weak_color_10.CGColor];
    
    
    UISearchBar *searchBar     = [[UISearchBar alloc] init];
    searchBar.placeholder      = @"搜索你需要的产品";
    searchBar.frame            = bgView.bounds;;
    searchBar.backgroundColor  = ThemeService.weak_color_10;
    //searchBar.tintColor      = [UIColor redColor];
    searchBar.barTintColor     = ThemeService.weak_color_10;
    
    [searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:ThemeService.weak_color_10] forState:UIControlStateNormal];
    
    [bgView addSubview:searchBar];
    
    
    searchBar.searchBarTextDidBeginEditing = ^(UISearchBar *searchBar){
        
        if([self.vc conformsToProtocol:@protocol(ProductListVCConfig)] &&
           [self.vc respondsToSelector:@selector(onTapSearchBarToProductSearch:)]){
            
            [self.vc onTapSearchBarToProductSearch:searchBar];
        }
        
    };
    
    return bgView;
}


@end
