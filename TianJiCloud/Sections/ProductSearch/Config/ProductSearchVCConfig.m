//
//  ProductSearchVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchVCConfig.h"
#import "ProductSearchController.h"
#import "UISearchBar+CommanStyle.h"


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
    
    
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH-140, 35);
    NSString *placeHolder = NSLocalizedString(@"product_search_input_navi", @"请输入您想查找的产品");
    UIView *bgView = [UISearchBar tjs_customStyleWithFrame:frame
                                               placeHolder:placeHolder
                                                     block:^(id sender) {
       
        UISearchBar *searchBar = (UISearchBar *)sender;
    
        searchBar.searchBarTextDidChange = ^(UISearchBar *searchBar, NSString *searchText) {
            
            
        };
        
        searchBar.searchBarSearchButtonClicked = ^(UISearchBar *searchBar) {
            
          
        };
        
        searchBar.searchBarCancelButtonClicked = ^(UISearchBar *searchBar) {
            
         
            
        };
    }];
    
    
    return bgView;
}


@end
