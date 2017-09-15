//
//  ProductVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListVCConfig.h"
#import "ProductContainerController.h"
#import "UISearchBar+CommanStyle.h"


@interface ProductListVCConfig ()<UISearchBarDelegate>

@property (nonatomic,weak) ProductContainerController *vc;

@end

@implementation ProductListVCConfig

- (instancetype)init{

    self = [super init];
    if(self){
     
        
    }
    
    return self;
}

- (void)setup:(ProductContainerController *)vc{
   
    _vc = vc;
    
    
}


#pragma mark - TJSNavigationConfig

- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems{

    UIBarButtonItem *leftItem  = [[UIBarButtonItem alloc] bk_initWithTitle:@"隐藏" style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        
    }];

    NSArray *leftBarButtonItems = _vc.navigationItem.leftBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [leftBarButtonItems mutableCopy];
    [mutable addObject:leftItem];
    return [mutable copy];
}


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

    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    
    return [mutable copy];
}

- (UIView *)tjs_titleView{
    
    
    CGRect frame = CGRectMake(-60, 0, SCREEN_WIDTH-80, 35);
    NSString *placeHolder = NSLocalizedString(@"product_search_home_navi", @"搜索你需要的产品");
    UIView *bgView = [UISearchBar tjs_customStyleWithFrame:frame
                                               placeHolder:placeHolder
                                                     block:^(id sender) {
        WEAK_SELF(self);
        UISearchBar *searchBar = (UISearchBar *)sender;
        searchBar.searchBarShouldBeginEditing = ^(UISearchBar *searchBar){
            STRONG_SELF(self);
            if([self.vc conformsToProtocol:@protocol(ProductListVCConfig)] &&
               [self.vc respondsToSelector:@selector(onTapSearchBarToProductSearch:)]){
                [self.vc onTapSearchBarToProductSearch:searchBar];
            }
            return NO;
        };
        searchBar.searchBarTextDidBeginEditing = ^(UISearchBar *searchBar){
            [self.vc.navigationController.navigationBar endEditing:YES];
        };
        searchBar.searchBarTextDidEndEditing = ^(UISearchBar *searchBar){
         
        };
    }];
    return bgView;
}


@end
