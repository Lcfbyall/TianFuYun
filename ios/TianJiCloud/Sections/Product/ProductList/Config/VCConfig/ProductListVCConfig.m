//
//  ProductVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListVCConfig.h"

#import "ProductListViewController.h"
#import "UISearchBar+CommanStyle.h"


@interface ProductListVCConfig ()<UISearchBarDelegate>

@property (nonatomic,weak) ProductListViewController *vc;

@end

@implementation ProductListVCConfig


- (void)setup:(ProductListViewController *)vc{
   
    _vc = vc;
    
    
}

@end
