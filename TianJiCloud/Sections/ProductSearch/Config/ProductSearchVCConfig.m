//
//  ProductSearchVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchVCConfig.h"
#import "ProductSearchController.h"

#import "UIImage+FromColor.h"
#import "UISearchBar+TJSBlock.h"
#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@interface ProductSearchVCConfig ()

@property (nonatomic,weak) ProductSearchController *vc;


@end
@implementation ProductSearchVCConfig

- (void)setup:(ProductSearchController *)vc{
  
    _vc = vc;
}

#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    WEAK_SELF(self);
    
    NSString *title = @"取消";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]bk_initWithTitle:title style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        STRONG_SELF(self);
        if(self){
        
           [self.vc.navigationController popViewControllerAnimated:NO];
        
        }
    }];
    
    [rightItem setTitleTextAttributes:
  
     @{NSForegroundColorAttributeName:[UIColor iOS7darkBlueColor],
          NSFontAttributeName :[UIFont systemFontOfSize:16.0]
          } forState:UIControlStateNormal];
    
    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    
    return [mutable copy];
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
    searchBar.placeholder      = @"请输入您想查找的产品";
    searchBar.frame            = bgView.bounds;;
    searchBar.backgroundColor  = ThemeService.weak_color_10;
    //searchBar.tintColor      = [UIColor redColor];
    searchBar.barTintColor     = ThemeService.weak_color_10;
    
    [searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:ThemeService.weak_color_10] forState:UIControlStateNormal];
    
    [bgView addSubview:searchBar];
    
    
    searchBar.searchBarTextDidBeginEditing = ^(UISearchBar *searchBar){
        
   
        
    };
    
    return bgView;
}

@end
