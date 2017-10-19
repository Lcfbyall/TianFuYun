//
//  MyFavVCConfig.m
//  TianJiCloud
//
//  Created by staff on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavVCConfig.h"
#import "MyFavViewController.h"

@interface MyFavVCConfig ()

@property (nonatomic,weak)MyFavViewController *vc;

@end

@implementation MyFavVCConfig

- (void)setup:(MyFavViewController *)vc{

    _vc = vc;
    

}

@end
