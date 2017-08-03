//
//  ProductVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListVCConfig.h"
#import "ProductContainerController.h"

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

    
    UIView *bgView = [UIView new];
    UIColor *bgColor = ThemeService.weak_color_10;
    CGRect frame   =  CGRectMake(0, 0, SCREEN_WIDTH-120, 35);
    bgView.frame   = frame;
    bgView.backgroundColor     = bgColor;
    bgView.layer.cornerRadius  = frame.size.height/2.0;
    bgView.layer.masksToBounds = YES;
 
    
    UISearchBar *searchBar     = [[UISearchBar alloc] init];
    searchBar.placeholder      = @"搜索你需要的产品";
    searchBar.frame            = bgView.bounds;;
    searchBar.backgroundColor  = bgColor;
    searchBar.tintColor      = [UIColor iOS7darkBlueColor];
    searchBar.barTintColor     = bgColor;
    
    [searchBar setSearchFieldBackgroundImage:[UIImage tjs_imageWithColor:bgColor size:searchBar.bounds.size] forState:UIControlStateNormal];
    
    [bgView addSubview:searchBar];
    
    WEAK_SELF(self);
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
        
        NSLog(@"哈哈");
        
    };
    
    return bgView;
}


@end
