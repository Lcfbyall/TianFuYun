//
//  ProductSearchVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchVCConfig.h"
#import "ProductSearchController.h"


@interface ProductSearchVCConfig ()

@property (nonatomic,weak) ProductSearchController *vc;


@end
@implementation ProductSearchVCConfig


#pragma mark - Public


- (void)setup:(ProductSearchController *)vc{
  
    _vc = vc;



}

- (void)viewDidAppear{

    [self setupTitleView];
}

- (void)setupTitleView{

   [_vc.navigationItem.titleView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       if([obj isKindOfClass:[UISearchBar class]]){
           if([obj canBecomeFirstResponder]){
             [obj becomeFirstResponder];
           }
           *stop = YES;
       }
   }];
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
     @{NSForegroundColorAttributeName:ThemeService.main_color_02,
          NSFontAttributeName :[UIFont systemFontOfSize:16.0]
          } forState:UIControlStateNormal];
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

    //frame = CGRectInset(bgView.bounds, 20, 0);
    UISearchBar *searchBar     = [[UISearchBar alloc] init];
    searchBar.placeholder      = @"请输入您想查找的产品";
    searchBar.frame            = frame;;
    searchBar.backgroundColor  = bgColor;
    searchBar.barTintColor     = bgColor;
    searchBar.tintColor        = ThemeService.main_color_02;

    [searchBar setSearchFieldBackgroundImage:[UIImage tjs_imageWithColor:bgColor size:searchBar.bounds.size] forState:UIControlStateNormal];
    [bgView addSubview:searchBar];
    
    //searchBar.showsCancelButton = YES;

    
    searchBar.searchBarTextDidChange = ^(UISearchBar *searchBar, NSString *searchText) {
        
        NSLog(@"searchBarTextDidChange");
    };
    
    searchBar.searchBarSearchButtonClicked = ^(UISearchBar *searchBar) {
        
        NSLog(@"searchBarSearchButtonClicked");
    };
    
    searchBar.searchBarCancelButtonClicked = ^(UISearchBar *searchBar) {
        
        NSLog(@"searchBarCancelButtonClicked");
        
    };
    
    
    
    return bgView;
}


@end
