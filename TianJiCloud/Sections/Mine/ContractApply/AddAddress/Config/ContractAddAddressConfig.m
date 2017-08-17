//
//  ContractAddAddressConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/17.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressConfig.h"

#import "AddAdressViewController.h"

@interface ContractAddAddressConfig ()

@property (nonatomic,weak) AddAdressViewController *vc;

@end

@implementation ContractAddAddressConfig

- (void)setup:(AddAdressViewController *)vc{

    _vc = vc;

    _vc.title = @"新增地址";
}


#pragma mark - <TJSBaseVCProtocol>


- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems{
    
    WEAK_SELF(self);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"提交" style:UIBarButtonItemStylePlain handler:^(id sender) {
        
        STRONG_SELF(self);
        if(self){
            
            if([self.vc conformsToProtocol:@protocol(ContractAddAddressConfig)] &&
               [self.vc respondsToSelector:@selector(onTapRightBarBtnToSaveAddress:)]){
                
                [self.vc onTapRightBarBtnToSaveAddress:sender];
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
