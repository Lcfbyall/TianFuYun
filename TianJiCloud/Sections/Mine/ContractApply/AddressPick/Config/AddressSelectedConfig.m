//
//  AddressSelectedConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressSelectedConfig.h"
#import "AddressSelectController.h"

@interface AddressSelectedConfig ()

@property(nonatomic,strong)AddressSelectController *vc;

@end


@implementation AddressSelectedConfig

- (void)setup:(AddressSelectController *)vc{

    _vc = vc;
    
    _vc.title = @"选择地址";
}

#pragma mark - <TJSNavigationConfig>

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    WEAK_SELF(self);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"管理" style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        STRONG_SELF(self);
        if(self){
            
            if([self.vc conformsToProtocol:@protocol(AddressSelectedConfig)] &&
               [self.vc respondsToSelector:@selector(onTapRightBarBtnToAddressManage:)]){
                
                [self.vc onTapRightBarBtnToAddressManage:sender];
            }
        }
    }];
    
    //rightItem setTitleTextAttributes:@{} forState:uita
    
    NSArray *rightBarButtonItems = _vc.navigationItem.rightBarButtonItems?:[NSArray array];
    NSMutableArray *mutable = [rightBarButtonItems mutableCopy];
    [mutable addObject:rightItem];
    
    return [mutable copy];
}

@end
