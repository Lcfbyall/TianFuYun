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
    UIColor *bgColor = ThemeService.weak_color_10;
    CGRect frame   =  CGRectMake(0, 0, SCREEN_WIDTH-120, 35);
    bgView.frame   = frame;
    bgView.backgroundColor     = bgColor;
    bgView.layer.cornerRadius  = frame.size.height/2.0;
    bgView.layer.masksToBounds = YES;
 
    
    UISearchBar *searchBar     = [[UISearchBar alloc] init];
    searchBar.placeholder      = @"请输入您想查找的产品";
    searchBar.frame            = bgView.bounds;;
    searchBar.backgroundColor  = bgColor;
    searchBar.tintColor      = [UIColor iOS7darkBlueColor];
    searchBar.barTintColor     = bgColor;
    
    [searchBar setSearchFieldBackgroundImage:[UIImage tjs_imageWithColor:bgColor size:searchBar.bounds.size] forState:UIControlStateNormal];
    
    [bgView addSubview:searchBar];
    
    
    searchBar.searchBarTextDidBeginEditing = ^(UISearchBar *searchBar){
        
   
        
    };
    
    searchBar.searchBarTextDidEndEditing = ^(UISearchBar *searchBar){
        
        NSLog(@"哈哈");
        
    };

    
    return bgView;
}

@end
