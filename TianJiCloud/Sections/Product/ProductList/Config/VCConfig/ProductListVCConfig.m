//
//  ProductVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListVCConfig.h"
#import "ProductListViewController.h"

#import <BlocksKit/UIBarButtonItem+BlocksKit.h>

@interface ProductListVCConfig ()

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

    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"全部",@"收藏"]];
    segment.frame     = CGRectMake(0,0,120,30);
    segment.tintColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    
    //[segment addTarget:self action:@selector(segmentcontrolTimeChange:) forControlEvents:UIControlEventValueChanged];
  
    return segment;
}


@end
