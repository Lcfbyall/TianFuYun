//
//  WithDrawDepositConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositConfig.h"
#import "WithDrawDepositController.h"

@interface WithDrawDepositConfig ()

@property (nonatomic,weak)WithDrawDepositController *vc;

@end

@implementation WithDrawDepositConfig


- (void)setup:(WithDrawDepositController *)vc{

    _vc = vc;
    
    _vc.title = @"佣金提现";
    
    _vc.navigationItem.rightBarButtonItems = [self tjs_rightBarButtonItems];
    
    _vc.params = [UINavigationBar translucentWhiteTint];
}


#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    WEAK_SELF(self);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"提现记录" style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        STRONG_SELF(self);
        if(self){
            
            [UIViewController tjs_pushViewController:WithDrawDepositRecordVC animated:YES];
        }
    }];
    
    [rightItem setTitleTextAttributes:
  
    @{
    NSForegroundColorAttributeName:ThemeService.origin_color_00,
    NSFontAttributeName:[UIFont systemFontOfSize:14.0f]
                                       
    } forState:UIControlStateNormal];
    
    
    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    
    return [mutable copy];
}



@end
