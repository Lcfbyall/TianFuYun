//
//  CumulativeInvestConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestConfig.h"
#import "CumulativeInvestController.h"

@interface CumulativeInvestConfig ()

@property (nonatomic,strong)CumulativeInvestController *vc;

@end


@implementation CumulativeInvestConfig

- (void)setup:(CumulativeInvestController *)vc{

    _vc = vc;
    
    _vc.title = @"累计投资";
    

}

#pragma mark - <TJSBaseVCConfig>




@end
