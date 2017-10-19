//
//  InvestProductController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "InvestProductController.h"
#import "CumulateInvestInfo.h"

@interface InvestProductController ()

@end

@implementation InvestProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CumulateInvestInfo *invest = self.params[@"CumulateInvestInfo"];
    
    self.title = invest.name;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
